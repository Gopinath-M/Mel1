# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "All right! I have started seeding, now please be patient."

puts "Creating Vendor"
vendor1 = Vendor.create(:name => 'Vendor_one',:address=>'PERANAKAN',:contact_no=>'012-112-1111', :is_active => true)
vendor2 = Vendor.create(:name => 'Vendor_two',:address=>'ST.PAUL HILL',:contact_no=>'012-112-1112', :is_active => true)
vendor3 = Vendor.create(:name => 'Vendor_three',:address=>'PULAU UPEH',:contact_no=>'012-112-1113', :is_active => true)
vendor4 = Vendor.create(:name => 'Vendor_four',:address=>'HARI MERDEKA',:contact_no=>'012-112-1114', :is_active => true)




puts "Creating Agencies"
begin
  file = File.open("public/Agency.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      Agency.create(:name=>record_split[0],:address=>record_split[1], :telephone_number=>record_split[2] ,:is_active=>true)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

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

puts "Creating Drivers"
begin
  file = File.open("public/Driver.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      Driver.create(:registration_id=>record_split[0],:name=>record_split[1], :telephone_number=>record_split[2])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

puts "Creating VehicleTypes"
begin
  file = File.open("public/VehicleType.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      VehicleType.create(:name=>record_split[0])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

puts "Creating Vehicles"
begin
  file = File.open("public/Vehicle.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      Vehicle.create(:registration_id=>record_split[0],:registration_number=>record_split[1],:vehicle_type_id=>record_split[2],:driver_id=>i,:model_name=>record_split[3],:registration_date=>record_split[4])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

puts "Creating Roles"
roles = ["Super Admin", "Department Admin", "Department User", "Unit Admin", "Resource Manager"]
roles.each do | role |
  role = Role.new(:name => role)
  role.save
end

puts "Creating Sample Units for the department JABATAN KETUA MENTERI MELAKA"
unit_user1 = Unit.create(:department_id => 1, :name => 'BAHAGIAN AUDIT DALAM & SIASATAN AWAM (BADSA)', :address=>'PERANAKAN',:telephone_number=>'012-345-5666', :is_active => 1)
unit_user2 = Unit.create(:department_id => 1, :name => 'BAHAGIAN DEWAN DAN MMKN', :address=>'ST.PAUL HILL',:telephone_number=>'012-345-5777', :is_active => 1)
unit_user3 = Unit.create(:department_id => 1, :name => 'UNIT KEWANGAN',:address=>'PULAU UPEH',:telephone_number=>'012-345-5888',  :is_active => 1)
unit_user4 = Unit.create(:department_id => 1, :name => 'UNIT KERAJAAN TEMPATAN (KT)',:address=>'HARI MERDEKA',:telephone_number=>'012-345-5999',  :is_active => 1)

puts "Creating Sample Units for the department JABATAN AGAMA ISLAM MELAKA"
unit_user1 = Unit.create(:department_id => 4, :name => 'UNIT KEWANGAN AGAMA', :address=>'PERANAKAN',:telephone_number=>'012-345-6666', :is_active => 1)
unit_user2 = Unit.create(:department_id => 4, :name => 'BAHAGIAN PERBADANAN KETUA MENTERI (CMI)',:address=>'ST.PAUL HILL',:telephone_number=>'012-345-6777', :is_active => 1)
unit_user3 = Unit.create(:department_id => 4, :name => 'BAHAGIAN PERKHIDMATAN TEKNOLOGI MAKLUMAT (BPTM)',:address=>'PULAU UPEH',:telephone_number=>'012-345-6888', :is_active => 1)
unit_user4 = Unit.create(:department_id => 4, :name => 'UNIT INTEGRITI',:address=>'HARI MERDEKA',:telephone_number=>'012-345-6999', :is_active => 1)

puts "Creating Sample Units for the department JABATAN KERJA RAYA MELAKA"
unit_user1 = Unit.create(:department_id => 6, :name => 'U ONE D SIX KERJA RAYA TEMPATAN (KT)',:address=>'PERANAKAN',:telephone_number=>'012-345-7666', :is_active => 1)
unit_user2 = Unit.create(:department_id => 6, :name => 'U TWO D SIX KERJA RAYA TEMPATAN (KT)',:address=>'ST.PAUL HILL',:telephone_number=>'012-345-7777', :is_active => 1)
unit_user3 = Unit.create(:department_id => 6, :name => 'U THREE D SIX KERJA RAYA TEMPATAN (KT)',:address=>'PULAU UPEH',:telephone_number=>'012-345-7888', :is_active => 1)
unit_user4 = Unit.create(:department_id => 6, :name => 'U FOUR D SIX KERJA RAYA TEMPATAN (KT)',:address=>'HARI MERDEKA',:telephone_number=>'012-345-7999', :is_active => 1)

puts "Creating Sample Units for the department JABATAN MUFTI NEGERI MELAKA"
unit_user1 = Unit.create(:department_id => 8, :name => 'U ONE D EIGHT MUFTI NEGERI TEMPATAN (KT)',:address=>'PERANAKAN',:telephone_number=>'012-345-8666', :is_active => 1)
unit_user2 = Unit.create(:department_id => 8, :name => 'U TWO D EIGHT MUFTI NEGERI TEMPATAN (KT)',:address=>'ST.PAUL HILL',:telephone_number=>'012-345-8777', :is_active => 1)
unit_user3 = Unit.create(:department_id => 8, :name => 'U THREE D EIGHT MUFTI NEGERI TEMPATAN (KT)',:address=>'PULAU UPEH',:telephone_number=>'012-345-8888', :is_active => 1)
unit_user4 = Unit.create(:department_id => 8, :name => 'U FOUR D EIGHT MUFTI NEGERI TEMPATAN (KT)',:address=>'HARI MERDEKA',:telephone_number=>'012-345-8999', :is_active => 1)


puts "Creating Super Admin"
super_admin = User.create(:ic_number => "123456781234", :email => 'manivannan.s@openwavecomp.in', :password => "password", :first_name => "openwave", :last_name => "superadmin",:username=>'Mani', :status => 'A', :state => 7, :sign_in_count => 1)
super_admin.activate_user
if super_admin.save!
  role_membership = RoleMembership.create(:user_id => super_admin.id, :role_id => 1, :status => 'A')
end
puts"Creating Sample Resource Manager for agency"
resource_manager1 = User.create(:ic_number => "123456781112", :email => 'sathisht@openwavecomp.in', :password => "password", :first_name => "James", :username => "James", :last_name => "Franklin", :status => 'A', :state => 7, :sign_in_count => 1)
resource_manager1.activate_user
rm_resource_manager1 = RoleMembership.create(:user_id => resource_manager1.id, :department_id => 0, :role_id => 5, :status => 'A')

resource_manager2 = User.create(:ic_number => "123456781113", :email => 'sathish@openwavecomp.in', :password => "password", :first_name => "Sheik", :username => "Sheik", :last_name => "Sultan", :status => 'A', :state => 7, :sign_in_count => 1)
resource_manager2.activate_user
rm_resource_manager2 = RoleMembership.create(:user_id => resource_manager2.id, :department_id => 0, :role_id => 5, :status => 'A')

puts "Creating Sample Department Admins for the departments JABATAN KETUA MENTERI MELAKA, JABATAN AGAMA ISLAM MELAKA, JABATAN KERJA RAYA MELAKA, JABATAN MUFTI NEGERI MELAKA "
department_admin1 = User.create(:ic_number => "123456781111", :email => 'sathish.t@openwavecomp.in', :password => "password", :first_name => "DeptAdmin",  :last_name => "JKMM", :username=>'Sathish', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin1.activate_user
rm_department_admin1 = RoleMembership.create(:user_id => department_admin1.id, :department_id => 1, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin2 = User.create(:ic_number => "123456784444", :email => 'sheikdawood.a@openwavecomp.in', :password => "password", :first_name => "DeptAdmin", :last_name => "JAIM",:username=>'Sheik', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin2.activate_user
rm_department_admin2 = RoleMembership.create(:user_id => department_admin2.id, :department_id => 4, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin3 = User.create(:ic_number => "123456786666", :email => 'sheikdawooda.a@openwavecomp.in', :password => "password", :first_name => "DeptAdmin", :last_name => "JKRM",:username=>'Sheik', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin3.activate_user
rm_department_admin3 = RoleMembership.create(:user_id => department_admin3.id, :department_id => 6, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin4 = User.create(:ic_number => "123456788888", :email => 'sheikdawoodb.a@openwavecomp.in', :password => "password", :first_name => "DeptAdmin", :last_name => "JMNM",:username=>'Sheik', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin4.activate_user
rm_department_admin4 = RoleMembership.create(:user_id => department_admin4.id, :department_id => 8, :role_id => 2, :status => 'A', :default_dept=>true)


puts "Creating Sample Department Users for JABATAN KETUA MENTERI MELAKA"
department_user1 = User.create(:ic_number => "123456781222", :email => 'sasitharan.t@openwavecomp.in', :password => "password", :first_name => "DeptUserFirst", :last_name => "JKMM",:username=>'Sasi', :status => 'A', :state => 7, :sign_in_count => 1)
department_user1.activate_user
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 1, :role_id => 4,:unit_id=>1, :status => 'A', :default_dept=>true)
department_user2 = User.create(:ic_number => "123456781333", :email => 'nirmala.a.b@openwavecomp.in', :password => "password", :first_name => "DeptUserSecond", :last_name => "JKMM",:username=>'Nirmala', :status => 'A', :state => 7, :sign_in_count => 1)
department_user2.activate_user
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 1, :role_id => 4, :unit_id=>2,:status => 'A', :default_dept=>true)
department_user3 = User.create(:ic_number => "123456781444", :email => 'prakashkumar.m@openwavecomp.in', :password => "password", :first_name => "DeptUserThird", :last_name => "JKMM",:username=>'Prakash', :status => 'A', :state => 7, :sign_in_count => 1)
department_user3.activate_user
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 1, :role_id => 4, :unit_id=>3,:status => 'A', :default_dept=>true)
department_user4 = User.create(:ic_number => "123456781555", :email => 'abuthahir.a.h@openwavecomp.in', :password => "password", :first_name => "DeptUserFour", :last_name => "JKMM", :username=>'Abu',:status => 'A', :state => 7, :sign_in_count => 1)
department_user4.activate_user
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 1, :role_id => 4, :unit_id=>4,:status => 'A', :default_dept=>true)
department_user5 = User.create(:ic_number => "123456781666", :email => 'owcsasitharan.t@openwavecomp.in', :password => "password", :first_name => "DeptUserFive", :last_name => "JKMM",:username=>'Sasi', :status => 'A', :state => 7, :sign_in_count => 1)
department_user5.activate_user
rm_department_user5 = RoleMembership.create(:user_id => department_user5.id, :department_id => 1, :role_id => 3,:unit_id=>1, :status => 'A', :default_dept=>true)
department_user6 = User.create(:ic_number => "123456781777", :email => 'owcnirmala.a.b@openwavecomp.in', :password => "password", :first_name => "DeptUserSix", :last_name => "JKMM",:username=>'Nirmala', :status => 'A', :state => 7, :sign_in_count => 1)
department_user6.activate_user
rm_department_user6 = RoleMembership.create(:user_id => department_user6.id, :department_id => 1, :role_id => 3, :unit_id=>2,:status => 'A', :default_dept=>true)
department_user7 = User.create(:ic_number => "123456781888", :email => 'owcprakashkumar.m@openwavecomp.in', :password => "password", :first_name => "DeptUserSeven", :last_name => "JKMM",:username=>'Prakash', :status => 'A', :state => 7, :sign_in_count => 1)
department_user7.activate_user
rm_department_user7= RoleMembership.create(:user_id => department_user7.id, :department_id => 1, :role_id => 3, :unit_id=>3,:status => 'A', :default_dept=>true)
department_user8 = User.create(:ic_number => "123456781999", :email => 'owcabuthahir.a.h@openwavecomp.in', :password => "password", :first_name => "DeptUserEight", :last_name => "JKMM",:username=>'Abu', :status => 'A', :state => 7, :sign_in_count => 1)
department_user8.activate_user
rm_department_user8 = RoleMembership.create(:user_id => department_user8.id, :department_id => 1, :role_id => 3, :unit_id=>4,:status => 'A', :default_dept=>true)


puts "Creating Sample Department Users for JABATAN AGAMA ISLAM MELAKA"
department_user1 = User.create(:ic_number => "123456784111", :email => 'anusudha.r@openwavecomp.in', :password => "password", :first_name => "DeptUserfirst", :last_name => "JAIM",:username=>'Anu', :status => 'A', :state => 7, :sign_in_count => 1)
department_user1.activate_user
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 4, :role_id => 4, :unit_id=>5,:status => 'A', :default_dept=>true)
department_user2 = User.create(:ic_number => "123456784222", :email => 'latha.k@openwavecomp.in', :password => "password", :first_name => "DeptUserSecond", :last_name => "JAIM",:username=>'Latha', :status => 'A', :state => 7, :sign_in_count => 1)
department_user2.activate_user
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 4, :role_id => 4, :unit_id=>6, :status => 'A', :default_dept=>true)
department_user3 = User.create(:ic_number => "123456784333", :email => 'sakthivel.m@openwavecomp.in', :password => "password", :first_name => "DeptUserThird", :last_name => "JAIM",:username=>'Sakthi', :status => 'A', :state => 7, :sign_in_count => 1)
department_user3.activate_user
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 4, :role_id => 4, :unit_id=>7, :status => 'A', :default_dept=>true)
department_user4 = User.create(:ic_number => "123456784555", :email => 'gopinath.m@openwavecomp.in', :password => "password", :first_name => "DeptUserFour", :last_name => "JAIM",:username=>'Gopi', :status => 'A', :state => 15, :sign_in_count => 1)
department_user4.activate_user
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 4, :role_id => 4, :unit_id=>8, :status => 'A', :default_dept=>true)
department_user5 = User.create(:ic_number => "123456784666", :email => 'owcanusudha.r@openwavecomp.in', :password => "password", :first_name => "DeptUserFive", :last_name => "JAIM", :username=>'Anu',:status => 'A', :state => 7, :sign_in_count => 1)
department_user5.activate_user
rm_department_user5 = RoleMembership.create(:user_id => department_user5.id, :department_id => 4, :role_id => 3, :unit_id=>5,:status => 'A', :default_dept=>true)
department_user6 = User.create(:ic_number => "123456784777", :email => 'owclatha.k@openwavecomp.in', :password => "password", :first_name => "DeptUserSix", :last_name => "JAIM",:username=>'Latha', :status => 'A', :state => 7, :sign_in_count => 1)
department_user6.activate_user
rm_department_user6 = RoleMembership.create(:user_id => department_user6.id, :department_id => 4, :role_id => 3, :unit_id=>6, :status => 'A', :default_dept=>true)
department_user7 = User.create(:ic_number => "123456784888", :email => 'owcsakthivel.m@openwavecomp.in', :password => "password", :first_name => "DeptUserSeven", :last_name => "JAIM",:username=>'Sakthi', :status => 'A', :state => 7, :sign_in_count => 1)
department_user7.activate_user
rm_department_user7 = RoleMembership.create(:user_id => department_user7.id, :department_id => 4, :role_id => 3, :unit_id=>7, :status => 'A', :default_dept=>true)
department_user8 = User.create(:ic_number => "123456784999", :email => 'owcgopinath.m@openwavecomp.in', :password => "password", :first_name => "DeptUserEight", :last_name => "JAIM",:username=>'Gopi', :status => 'A', :state => 15, :sign_in_count => 1)
department_user8.activate_user
rm_department_user8 = RoleMembership.create(:user_id => department_user8.id, :department_id => 4, :role_id => 3, :unit_id=>8, :status => 'A', :default_dept=>true)



puts "Creating Sample Department Users for JABATAN KERJA RAYA MELAKA"
department_user1 = User.create(:ic_number => "123456786111", :email => 'owc2anusudha.r@openwavecomp.in', :password => "password", :first_name => "DeptUserFirst", :last_name => "JKRM",:username=>'Anu', :status => 'A', :state => 7, :sign_in_count => 1)
department_user1.activate_user
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 6, :role_id => 4, :unit_id=>9,:status => 'A', :default_dept=>true)
department_user2 = User.create(:ic_number => "123456786222", :email => 'owc2latha.k@openwavecomp.in', :password => "password", :first_name => "DeptUserSecond", :last_name => "JKRM",:username=>'Latha', :status => 'A', :state => 7, :sign_in_count => 1)
department_user2.activate_user
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 6, :role_id => 4, :unit_id=>10, :status => 'A', :default_dept=>true)
department_user3 = User.create(:ic_number => "123456786333", :email => 'owc2sakthivel.m@openwavecomp.in', :password => "password", :first_name => "DeptUserThird", :last_name => "JKRM",:username=>'Sakthi', :status => 'A', :state => 15, :sign_in_count => 1)
department_user4.activate_user
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 6, :role_id => 4, :unit_id=>12, :status => 'A', :default_dept=>true)
department_user5 = User.create(:ic_number => "123456786555", :email => 'owc1anusudha.r@openwavecomp.in', :password => "password", :first_name => "DeptUserFirst", :last_name => "JKRM",:username=>'Anu', :status => 'A', :state => 7, :sign_in_count => 1)
department_user5.activate_user
rm_department_user5 = RoleMembership.create(:user_id => department_user5.id, :department_id => 6, :role_id => 3, :unit_id=>9,:status => 'A', :default_dept=>true)
department_user6 = User.create(:ic_number => "123456786777", :email => 'owc1latha.k@openwavecomp.in', :password => "password", :first_name => "DeptUserSix", :last_name => "JKRM",:username=>'Latha', :status => 'A', :state => 7, :sign_in_count => 1)
department_user6.activate_user
rm_department_user6 = RoleMembership.create(:user_id => department_user6.id, :department_id => 6, :role_id => 3, :unit_id=>10, :status => 'A', :default_dept=>true)
department_user7 = User.create(:ic_number => "123456786888", :email => 'owc1sakthivel.m@openwavecomp.in', :password => "password", :first_name => "DeptUserSeven", :last_name => "JKRM",:username=>'Sakthi', :status => 'A', :state => 7, :sign_in_count => 1)
department_user7.activate_user
rm_department_user7 = RoleMembership.create(:user_id => department_user7.id, :department_id => 6, :role_id => 3, :unit_id=>11, :status => 'A', :default_dept=>true)
department_user8 = User.create(:ic_number => "123456786999", :email => 'owc1gopinath.m@openwavecomp.in', :password => "password", :first_name => "DeptUserEight", :last_name => "JKRM",:username=>'Gopi', :status => 'A', :state => 15, :sign_in_count => 1)
department_user8.activate_user
rm_department_user8 = RoleMembership.create(:user_id => department_user8.id, :department_id => 6, :role_id => 3, :unit_id=>12, :status => 'A', :default_dept=>true)




puts "Creating Sample Department Users for JABATAN MUFTI NEGERI MELAKA"
department_user1 = User.create(:ic_number => "123456788111", :email => 'owc_anusudha.r@openwavecomp.in', :password => "password", :first_name => "DeptUserFirst", :last_name => "JKRM",:username=>'Anu', :status => 'A', :state => 7, :sign_in_count => 1)
department_user1.activate_user
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 8, :role_id => 4, :unit_id=>13,:status => 'A', :default_dept=>true)
department_user2 = User.create(:ic_number => "123456788222", :email => 'owc_latha.k@openwavecomp.in', :password => "password", :first_name => "DeptUserSecond", :last_name => "JKRM",:username=>'Latha', :status => 'A', :state => 7, :sign_in_count => 1)
department_user2.activate_user
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 8, :role_id => 4, :unit_id=>14, :status => 'A', :default_dept=>true)
department_user3 = User.create(:ic_number => "123456788333", :email => 'owc_sakthivel.m@openwavecomp.in', :password => "password", :first_name => "DeptUserThird", :last_name => "JKRM",:username=>'Sakthi', :status => 'A', :state => 7, :sign_in_count => 1)
department_user3.activate_user
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 8, :role_id => 4, :unit_id=>15, :status => 'A', :default_dept=>true)
department_user4 = User.create(:ic_number => "123456788444", :email => 'owc_gopinath.m@openwavecomp.in', :password => "password", :first_name => "DeptUserFour", :last_name => "JKRM",:username=>'Gopi', :status => 'A', :state => 15, :sign_in_count => 1)
department_user4.activate_user
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 8, :role_id => 4, :unit_id=>16, :status => 'A', :default_dept=>true)
department_user5 = User.create(:ic_number => "123456788555", :email => 'owc1_anusudha.r@openwavecomp.in', :password => "password", :first_name => "DeptUserFive", :last_name => "JKRM",:username=>'Anu', :status => 'A', :state => 7, :sign_in_count => 1)
department_user5.activate_user
rm_department_user5 = RoleMembership.create(:user_id => department_user5.id, :department_id => 8, :role_id => 3, :unit_id=>13,:status => 'A', :default_dept=>true)
department_user6 = User.create(:ic_number => "123456788666", :email => 'owc1_latha.k@openwavecomp.in', :password => "password", :first_name => "DeptUserSix", :last_name => "JKRM",:username=>'Latha', :status => 'A', :state => 7, :sign_in_count => 1)
department_user6.activate_user
rm_department_user6 = RoleMembership.create(:user_id => department_user6.id, :department_id => 8, :role_id => 3, :unit_id=>14, :status => 'A', :default_dept=>true)
department_user7 = User.create(:ic_number => "123456788777", :email => 'owc1_sakthivel.m@openwavecomp.in', :password => "password", :first_name => "DeptUserSeven", :last_name => "JKRM",:username=>'Sakthi', :status => 'A', :state => 7, :sign_in_count => 1)
department_user7.activate_user
rm_department_user7 = RoleMembership.create(:user_id => department_user7.id, :department_id => 8, :role_id => 3, :unit_id=>15, :status => 'A', :default_dept=>true)
department_user8 = User.create(:ic_number => "123456788999", :email => 'owc1_gopinath.m@openwavecomp.in', :password => "password", :first_name => "DeptUserEight", :last_name => "JKRM",:username=>'Gopi', :status => 'A', :state => 15, :sign_in_count => 1)
department_user8.activate_user
rm_department_user8 = RoleMembership.create(:user_id => department_user8.id, :department_id => 8, :role_id => 3, :unit_id=>16, :status => 'A', :default_dept=>true)



puts "Creating sample resources for a resources category"
resource_categories1 = Category.create( :name => 'Stationery Item')
resource_categories2 = Category.create( :name => 'Computer Hardware and Accessories')
resource_categories3 = Category.create(:name => 'Computer Software')
#resource_categories4 = Category.create(:category_id => 4, :name => 'canteen')
resource_categories4 = Category.create( :name => 'Communications')
#resource_categories1 = Category.create(:category_id => 6, :name => 'first aid kit')
resource_categories5 = Category.create( :name => 'Office Furniture and Equipment')
resource_categories6 = Category.create( :name => 'Transportation')

puts "Creating Sample sub resource category for a stationery item resource category"
resource_sub_categories1 = SubCategory.create(:category_id => 1, :name => 'Pencil')
resource_sub_categories2 = SubCategory.create(:category_id => 1, :name => 'Paper Weight')
resource_sub_categories3 = SubCategory.create(:category_id => 1, :name => 'Register Book')
resource_sub_categories4 = SubCategory.create(:category_id => 1, :name => 'Stapler (small & big)')
resource_sub_categories5 = SubCategory.create(:category_id => 1, :name => 'Stapler Pin (small & big)')
resource_sub_categories6 = SubCategory.create(:category_id => 1, :name => 'Stamp Pad')
resource_sub_categories7 = SubCategory.create(:category_id => 1, :name => 'Stamp Pad Ink')
resource_sub_categories8 = SubCategory.create(:category_id => 1, :name => 'Pen')
resource_sub_categories9 = SubCategory.create(:category_id => 1, :name => 'File Folder')
resource_sub_categories10 = SubCategory.create(:category_id => 1, :name => 'Gum')
resource_sub_categories11 = SubCategory.create(:category_id => 1, :name => 'Permanent Marker')
resource_sub_categories12 = SubCategory.create(:category_id => 1, :name => 'Hand Book')
resource_sub_categories13 = SubCategory.create(:category_id => 1, :name => 'Envelope(small)')
resource_sub_categories14 = SubCategory.create(:category_id => 1, :name => 'Envelope(large)')
resource_sub_categories15 = SubCategory.create(:category_id => 1, :name => 'Sealing Wax')
resource_sub_categories16 = SubCategory.create(:category_id => 1, :name => 'Brown Cover(A4 size)')
resource_sub_categories17 = SubCategory.create(:category_id => 1, :name => 'White Paper(A4 size)')
resource_sub_categories18 = SubCategory.create(:category_id => 1, :name => 'Double Punch')
resource_sub_categories19 = SubCategory.create(:category_id => 1, :name => 'White Board and Duster')
resource_sub_categories20 = SubCategory.create(:category_id => 1, :name => 'Calculator')
resource_sub_categories21 = SubCategory.create(:category_id => 1, :name => 'Trace Paper')
resource_sub_categories22 = SubCategory.create(:category_id => 1, :name => 'Cash Book')


puts "Creating Sample sub resource category for a computer hardware and accessories "
resource_sub_categories1 = SubCategory.create(:category_id => 2, :name => 'Desktop computer and monitor')
resource_sub_categories2 = SubCategory.create(:category_id => 2, :name => 'Keyboard and Mouse')
resource_sub_categories3 = SubCategory.create(:category_id => 2, :name => 'Printer')
resource_sub_categories4 = SubCategory.create(:category_id => 2, :name => 'Modem')
resource_sub_categories5 = SubCategory.create(:category_id => 2, :name => 'Notebook Computer')
resource_sub_categories6 = SubCategory.create(:category_id => 2, :name => 'CD Writer')
resource_sub_categories7 = SubCategory.create(:category_id => 2, :name => 'PowerPoint Projector')
resource_sub_categories8 = SubCategory.create(:category_id => 2, :name => 'Digital Camera')
resource_sub_categories9 = SubCategory.create(:category_id => 2, :name => 'Handheld Organizer')
resource_sub_categories10 = SubCategory.create(:category_id => 2, :name => 'Surge Protector')
resource_sub_categories11 = SubCategory.create(:category_id => 2, :name => 'Computer Locks')
resource_sub_categories12 = SubCategory.create(:category_id => 2, :name => 'Scanner')
resource_sub_categories13 = SubCategory.create(:category_id => 2, :name => 'Laptop')

puts "Creating Sample sub resource category for a computer software"
resource_sub_categories1 = SubCategory.create(:category_id => 3, :name => 'Word Processing Software')
resource_sub_categories2 = SubCategory.create(:category_id => 3, :name => 'Virus protection Software')
resource_sub_categories3 = SubCategory.create(:category_id => 3, :name => 'Accounting Software')
resource_sub_categories4 = SubCategory.create(:category_id => 3, :name => 'Desktop Publishing Software')
resource_sub_categories5 = SubCategory.create(:category_id => 3, :name => 'Contact Management Software')
resource_sub_categories6 = SubCategory.create(:category_id => 3, :name => 'Website Building and Maintenance Software')
resource_sub_categories7 = SubCategory.create(:category_id => 3, :name => 'Payment Processing Software')
resource_sub_categories8 = SubCategory.create(:category_id => 3, :name => 'E-commerce Software')
resource_sub_categories9 = SubCategory.create(:category_id => 3, :name => 'Inventory Management Software')

puts "Creating Sample sub resource category for a Communications"
resource_sub_categories1 = SubCategory.create(:category_id => 4, :name => 'Telephone Line')
resource_sub_categories2 = SubCategory.create(:category_id => 4, :name => 'Internet Connection')
resource_sub_categories3 = SubCategory.create(:category_id => 4, :name => 'Toll-free Line')
resource_sub_categories4 = SubCategory.create(:category_id => 4, :name => 'Desk Telephone')
resource_sub_categories5 = SubCategory.create(:category_id => 4, :name => 'Fax Machine')
resource_sub_categories6 = SubCategory.create(:category_id => 4, :name => 'Cordless Telephone')
resource_sub_categories7 = SubCategory.create(:category_id => 4, :name => 'Answering Machine/Service')
resource_sub_categories8 = SubCategory.create(:category_id => 4, :name => 'Cordless Headset')
resource_sub_categories9 = SubCategory.create(:category_id => 4, :name => 'Speakerphone')
resource_sub_categories10 = SubCategory.create(:category_id => 4, :name => 'Pager')
resource_sub_categories11 = SubCategory.create(:category_id => 4, :name => 'Tape Recorder')
resource_sub_categories12 = SubCategory.create(:category_id => 4, :name => 'Cellular Telephone with Internet Features')

#puts "Creating Sample sub resource category for a first aid kit"
#resource_sub_categories1 = SubCategory.create(:category_id => 4, :name => 'band-aid')
#resource_sub_categories2 = SubCategory.create(:category_id => 4, :name => 'antibiotic ointment')
#resource_sub_categories3 = SubCategory.create(:category_id => 4, :name => 'tablets')
#resource_sub_categories4 = SubCategory.create(:category_id => 4, :name => 'dettol')
#resource_sub_categories5 = SubCategory.create(:category_id => 4, :name => 'vicks')
#resource_sub_categories6 = SubCategory.create(:category_id => 4, :name => 'antiseptic wipes')
#resource_sub_categories7 = SubCategory.create(:category_id => 4, :name => 'thermometer')

puts "Creating Sample sub resource category for a furnitures resource category"
resource_sub_categories1 = SubCategory.create(:category_id => 5, :name => 'Desk')
resource_sub_categories2 = SubCategory.create(:category_id => 5, :name => 'Comfortable Chair')
resource_sub_categories3 = SubCategory.create(:category_id => 5, :name => 'File Cabinets')
resource_sub_categories4 = SubCategory.create(:category_id => 5, :name => 'Overhead and Work Lighting')
resource_sub_categories5 = SubCategory.create(:category_id => 5, :name => 'Client Seating')
resource_sub_categories6 = SubCategory.create(:category_id => 5, :name => 'Fireproof Safe')
resource_sub_categories7 = SubCategory.create(:category_id => 5, :name => 'Desktop and Pocket Calculators')
resource_sub_categories8 = SubCategory.create(:category_id => 5, :name => 'Bookcases')
resource_sub_categories9 = SubCategory.create(:category_id => 5, :name => 'Postage Meter')
resource_sub_categories10 = SubCategory.create(:category_id => 5, :name => 'Worktable(s)')
resource_sub_categories11 = SubCategory.create(:category_id => 5, :name => 'Office Decorations')
resource_sub_categories12 = SubCategory.create(:category_id => 5, :name => 'Wall Whiteboard and Markers')
resource_sub_categories13 = SubCategory.create(:category_id => 5, :name => 'Photocopier')
resource_sub_categories14 = SubCategory.create(:category_id => 5, :name => 'Wastebasket')
resource_sub_categories15 = SubCategory.create(:category_id => 5, :name => 'Recycling Bin')
resource_sub_categories16 = SubCategory.create(:category_id => 5, :name => 'Alarm System')
resource_sub_categories17 = SubCategory.create(:category_id => 5, :name => 'Fire Extinguisher')
resource_sub_categories18 = SubCategory.create(:category_id => 5, :name => 'First-aid Kit')

puts "Creating Sample sub resource category for a transportation category"
resource_sub_categories1 = SubCategory.create(:category_id => 6, :name => "Heavyvehicles")
resource_sub_categories2 = SubCategory.create(:category_id => 6, :name => "Lightvehicles")

puts "Whoa, im done! Now you can run the server and see the application"
