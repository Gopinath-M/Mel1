# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "All right! I have started seeding, now please be patient."

puts "Creating Agencies"
agency1 = Agency.create(:name => 'Agency_one', :status => 'A')
agency2 = Agency.create(:name => 'Agency_two', :status => 'A')

puts "Creating Departments"
begin
      file = File.open("public/Department.csv", "r")
      file.readlines.each_with_index do |record, i|
        begin
          Department.create(:agency_id => 1, :name=>record, :is_active=>true, :created_by=>1, :updated_by=>1)
        rescue Exception =>e
          p "Exception ocurred due to #{e.to_s} at #{i}"
        end
      end
    rescue Exception=>e
      p "Exception due to : #{e.to_s}"
    end

puts "Creating States"
begin
      file = File.open("public/State.csv", "r")
      file.readlines.each_with_index do |record, i|
        begin
          record_split = record.split(",")
          State.create(:name=>record_split[0],:code=>record_split[1], :tel_code=>record_split[2])
        rescue Exception =>e
          p "Exception ocurred due to #{e.to_s} at #{i}"
        end
      end
    rescue Exception=>e
      p "Exception due to : #{e.to_s}"
    end

puts "Creating Roles"
roles = ["Super Admin", "Department Admin", "Department User", "Unit Admin"]
roles.each do | role |
                  role = Role.new(:name => role)
                   role.save
          end

puts "Creating Super Admin"
super_admin = User.new(:ic_number => "123456-78-1234", :email => 'manivannan.s@openwavecomp.in', :password => "password", :first_name => "openwave", :last_name => "superadmin", :status => 'A')
    if super_admin.save
      role_membership = RoleMembership.create(:user_id => super_admin.id, :role_id => 1, :status => 'A')
    end

puts "Creating Sample Department Admins for the departments JABATAN KETUA MENTERI MELAKA and JABATAN AGAMA ISLAM MELAKA"
department_admin1 = User.create(:ic_number => "123456-78-1111", :email => 'sathish.t@openwavecomp.in', :password => "password", :first_name => "DeptAdmin", :last_name => "JKMM", :status => 'A')
rm_department_admin1 = RoleMembership.create(:user_id => department_admin1.id, :department_id => 1, :role_id => 2, :status => 'A')
department_admin2 = User.create(:ic_number => "123456-78-2222", :email => 'sheikdawood.a@openwavecomp.in', :password => "password", :first_name => "DeptAdmin", :last_name => "JAIM", :status => 'A')
rm_department_admin2 = RoleMembership.create(:user_id => department_admin2.id, :department_id => 4, :role_id => 2, :status => 'A')


puts "Creating Sample Department Users for JABATAN KETUA MENTERI MELAKA"
department_user1 = User.create(:ic_number => "123456-78-1222", :email => 'sasitharan.t@openwavecomp.in', :password => "password", :first_name => "DeptUserfirst", :last_name => "JKMM", :status => 'A')
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 1, :role_id => 3, :status => 'A')
department_user2 = User.create(:ic_number => "123456-78-1333", :email => 'nirmala.a.b@openwavecomp.in', :password => "password", :first_name => "DeptUserSecond", :last_name => "JKMM", :status => 'A')
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 1, :role_id => 3, :status => 'A')
department_user3 = User.create(:ic_number => "123456-78-1444", :email => 'prakashkumar.m@openwavecomp.in', :password => "password", :first_name => "DeptUserThird", :last_name => "JKMM", :status => 'A')
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 1, :role_id => 3, :status => 'A')
department_user4 = User.create(:ic_number => "123456-78-1555", :email => 'abuthahir.a.h@openwavecomp.in', :password => "password", :first_name => "DeptUserFour", :last_name => "JKMM", :status => 'A')
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 1, :role_id => 3, :status => 'A')

puts "Creating Sample Department Users for JABATAN AGAMA ISLAM MELAKA"
department_user1 = User.create(:ic_number => "123456-78-2222", :email => 'anusudha.r@openwavecomp.in', :password => "password", :first_name => "DeptUserfirst", :last_name => "JAIM", :status => 'A')
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 4, :role_id => 3, :status => 'A')
department_user2 = User.create(:ic_number => "123456-78-2333", :email => 'latha.k@openwavecomp.in', :password => "password", :first_name => "DeptUserSecond", :last_name => "JAIM", :status => 'A')
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 4, :role_id => 3, :status => 'A')
department_user3 = User.create(:ic_number => "123456-78-2444", :email => 'sakthivel.m@openwavecomp.in', :password => "password", :first_name => "DeptUserThird", :last_name => "JAIM", :status => 'A')
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 4, :role_id => 3, :status => 'A')
department_user4 = User.create(:ic_number => "123456-78-2555", :email => 'gopinath.m@openwavecomp.in', :password => "password", :first_name => "DeptUserFour", :last_name => "JAIM", :status => 'A')
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 4, :role_id => 3, :status => 'A')

puts "Creating Sample Units for the department JABATAN KETUA MENTERI MELAKA"
unit_user1 = Unit.create(:department_id => 1, :name => 'BAHAGIAN AUDIT DALAM & SIASATAN AWAM (BADSA)', :is_active => 1)
unit_user2 = Unit.create(:department_id => 1, :name => 'BAHAGIAN DEWAN DAN MMKN',:is_active => 1)
unit_user3 = Unit.create(:department_id => 1, :name => 'UNIT KEWANGAN', :is_active => 1)
unit_user4 = Unit.create(:department_id => 1, :name => 'UNIT KERAJAAN TEMPATAN (KT)', :is_active => 1)

puts "Creating Sample Units for the department JABATAN AGAMA ISLAM MELAKA"
unit_user1 = Unit.create(:department_id => 4, :name => 'UNIT KEWANGAN', :is_active => 1)
unit_user2 = Unit.create(:department_id => 4, :name => 'BAHAGIAN PERBADANAN KETUA MENTERI (CMI)', :is_active => 1)
unit_user3 = Unit.create(:department_id => 4, :name => 'BAHAGIAN PERKHIDMATAN TEKNOLOGI MAKLUMAT (BPTM)', :is_active => 1)
unit_user4 = Unit.create(:department_id => 4, :name => 'UNIT INTEGRITI', :is_active => 1)

puts "Whoa, im done! Now you can run the server and see the application"
