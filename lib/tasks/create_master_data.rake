namespace :tap do
	task :it => [:environment, "db:drop", "db:create", "db:migrate", "db:seed"] do
	end
	
	desc "Creating roles"
	task :roles  => :environment do
		roles = ["Super Admin", "Department Admin", "Department User", "Unit Admin"]
    roles.each do | role |
      role = Role.new(:name => role)
      role.save
    end
  end
   
  desc "Creating Super Admin User"
	task :super_admin => :environment do
    super_admin = User.new(:ic_number => "123456-78-1234", :email => 'manivannan.s@openwavecomp.in', :username => "openwave", :password => "password", :first_name => "openwave", :last_name => "superadmin")
    if super_admin.save
      #role_membership = RoleMembership.create(:user_id => super_admin.id, :role_id => 1)
    end
  end




end

namespace :pg do
  desc "Archiving Tables"
  task :archive_tables => :environment do
    db_config = Rails.application.config.database_configuration[Rails.env]
    #stamp the filename
    datestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    path = "db_backup/#{datestamp}/"
    if File.exists?(path)
      d = Dir.new(path)
      d.each  {|filename|
      }
    else
      #      FileUtils.mkdir_p(File.dirname(path(path)))
      @dirName = Dir.mkdir(path,0777) #Create a new directory
    end

    # add to array the tables to be archived
    tables = [ 'departments','users', 'agencies']
    tables1 = ['resource_ict_equipment_bookings','resource_bookings','resource_room_bookings','resource_transportation_bookings']
    tables.each do |table|
      sh "pg_dump -h localhost -U #{db_config['username']}  #{db_config['database']} -t #{table} > #{path}#{datestamp}_#{table}_file.dmp"
      sleep(10)
    end
    tables.each do |t1|
      ActiveRecord::Base.connection.tables.each do |table1|
        ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table1};")
      end
    end
  end

  task :sql_dump  => :environment do
    path = Dir.glob("db_backup/*").max_by {|f| File.mtime(f)}
    db_config = Rails.application.config.database_configuration[Rails.env]
    tables = ['users', 'departments', 'units']
    Dir.glob("#{path}/*.dmp") do |dmp_file|
      sh "psql -h localhost -U #{db_config['username']}  -a  #{db_config['database']}  < #{dmp_file}"
    end
  end
end

namespace :test do
  task :ict_hardware => :environment do
    begin
      p ActiveRecord::Base.connection.execute("TRUNCATE Facility_Ict_Hardwares")
      #     p ActiveRecord::Base.connection.execute("drop table Facility_Ict_Hardwares")
      #     ActiveRecord::Base.connection.execute "CREATE TABLE Facility_Ict_Hardwares (id integer, name varchar(256), hardware_type integer, is_active boolean)"
      file = File.open("public/Facility_Ict_Hardwares.csv", "r")
      file.readlines.each_with_index do |record, i|
        begin
          record_split = record.split(",")
          FacilityIctHardware.create(:name=>record_split[0],:hardware_type=>record_split[1],:is_active=>true)
        rescue Exception =>e
          p "Exception ocurred due to #{e.to_s} at #{i}"
        end
      end
    rescue Exception=>e
      p "Exception due to : #{e.to_s}"
    end
  end
end


namespace :db do
  task :ict_wiring => :environment do
    begin
      p ActiveRecord::Base.connection.execute("TRUNCATE Facility_Ict_Wirings")
      file = File.open("public/Facility_Ict_Wirings.csv", "r")
      file.readlines.each_with_index do |record, i|
        begin
          record_split = record.split(",")
          FacilityIctWiring.create(:name=>record_split[0],:facility_hardware_id=>record_split[1],:is_active=>true)
        rescue Exception =>e
          p "Exception ocurred due to #{e.to_s} at #{i}"
        end
      end
    rescue Exception=>e
      p "Exception due to : #{e.to_s}"
    end
  end
end

		
	     
	   
	   
         		
    
