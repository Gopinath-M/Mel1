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



#
#puts "Creating Agencies"
#begin
#  file = File.open("public/Agency.csv", "r")
#  file.readlines.each_with_index do |record, i|
#    begin
#      record_split = record.split(",")
#      Agency.create(:name=>record_split[0],:address=>record_split[1], :telephone_number=>record_split[2] ,:is_active=>true)
#    rescue Exception =>e
#      p "Exception ocurred due to #{e.to_s} at #{i}"
#    end
#  end
#rescue Exception=>e
#  p "Exception due to : #{e.to_s}"
#end
#
#puts "Creating Departments"
#begin
#  file = File.open("public/Department.csv", "r")
#  file.readlines.each_with_index do |record, i|
#    begin
#      n=18
#      agency_id=(1..n).to_a.sample
#      record_split = record.split(",")
#      Department.create!(:agency_id => agency_id, :name=>record_split[0].titleize,:address=>record_split[1],:telephone_number=>record_split[2], :is_active=>true, :created_by=>1, :updated_by=>1)
#    rescue Exception =>e
#      p "Exception ocurred due to #{e.to_s} at #{i}"
#    end
#  end
#rescue Exception=>e
#  p "Exception due to : #{e.to_s}"
#end

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


puts "Creating Roles"
roles = ["Super Admin", "Department Admin", "Department User", "Unit Admin", "Resource Manager","Datuk SUK","SUK Deputy","Human Resource","Y.A.B Chief Minister"]
roles.each do | role |
  role = Role.new(:name => role)
  role.save
end


puts "Creating Agencies"
Agency.create(:name => 'Agency_one',:address=>'Agency One',:telephone_number=>'012-345-1111', :is_active => true)
Agency.create(:name => 'Agency_two',:address=>'Agency Two',:telephone_number=>'012-345-2222', :is_active => true)
Agency.create(:name => 'Agency_three',:address=>'Agency Two',:telephone_number=>'012-345-3333', :is_active => true)
Agency.create(:name => 'Prakash_Agency_One',:address=>'Test Address',:telephone_number=>'012-345-1110', :is_active => true)
Agency.create(:name => 'Prakash_Agency_Two',:address=>'Test Address 2',:telephone_number=>'012-345-2202', :is_active => true)
Agency.create(:name => 'Prakash_Agency_Third',:address=>'Test Address 3',:telephone_number=>'012-345-3033', :is_active => true)
Agency.create(:name => 'Prakash_Agency_Fourth',:address=>'Test Address 4',:telephone_number=>'012-345-0111', :is_active => true)
Agency.create(:name => 'Prakash_Agency_Fifth',:address=>'Test Address 5',:telephone_number=>'012-345-2022', :is_active => true)

puts "Creating Departments"
Department.create(:name=>'Jabatan Ketua Menteri Melaka',:address=>'Dept One',:telephone_number=>'012-345-4444',:agency_id=>1,:is_active=>true)
Department.create(:name=>'Jabatan Mufti Negeri Melaka',:address=>'Dept Two',:telephone_number=>'012-345-5555',:agency_id=>1,:is_active=>true)
Department.create(:name=>'Jabatan Agama Islam Melaka',:address=>'Dept Three',:telephone_number=>'012-345-6666',:agency_id=>2,:is_active=>true)
Department.create(:name=>'Jabatan Kerja Raya Melaka',:address=>'Dept Four',:telephone_number=>'012-345-7777',:agency_id=>2,:is_active=>true)
Department.create(:name=>'Jabatan Pertanian Negeri Melaka',:address=>'Dept Five',:telephone_number=>'012-345-8888',:agency_id=>3,:is_active=>true)
Department.create(:name=>'Jabatan Kebajikan Masyarakat',:address=>'Dept Six',:telephone_number=>'012-345-9999',:agency_id=>3,:is_active=>true)
Department.create(:name=>'Test Department2 of Prakash_Agency_One',:address=>'Dept One',:telephone_number=>'012-345-4446',:agency_id=>4,:is_active=>true)
Department.create(:name=>'Test Department2 of Prakash_Agency_Two',:address=>'Dept Two',:telephone_number=>'012-345-5557',:agency_id=>5,:is_active=>true)
Department.create(:name=>'Test Department2 of Prakash_Agency_Third',:address=>'Dept Three',:telephone_number=>'012-345-6668',:agency_id=>6,:is_active=>true)
Department.create(:name=>'Test Department3 of Prakash_Agency_One',:address=>'Dept Four',:telephone_number=>'012-345-7779',:agency_id=>4,:is_active=>true)
Department.create(:name=>'Test Department1 of Prakash_Agency_One',:address=>'Dept Five',:telephone_number=>'012-345-8882',:agency_id=>4,:is_active=>true)
Department.create(:name=>'Test Department1 of Prakash_Agency_Two',:address=>'Dept Six',:telephone_number=>'012-345-9995',:agency_id=>5,:is_active=>true)
Department.create(:name=>'Test Department12 of Prakash_Agency_two',:address=>'Dept One',:telephone_number=>'012-345-4446',:agency_id=>5,:is_active=>true)
Department.create(:name=>'Test Department3 of Prakash_Agency_Two',:address=>'Dept Two',:telephone_number=>'012-345-5558',:agency_id=>5,:is_active=>true)
Department.create(:name=>'Test Department1 of Prakash_Agency_Third',:address=>'Dept Three',:telephone_number=>'012-345-6665',:agency_id=>6,:is_active=>true)
Department.create(:name=>'Test Department3 of Prakash_Agency_Third',:address=>'Dept Four',:telephone_number=>'012-345-7775',:agency_id=>6,:is_active=>true)
Department.create(:name=>'Test Department1 of Prakash_Agency_Four',:address=>'Dept Five',:telephone_number=>'012-345-8885',:agency_id=>7,:is_active=>true)



#puts "Creating Sample Units for the department JABATAN KETUA MENTERI MELAKA"
#unit_user1 = Unit.create(:department_id => 1, :name => 'BAHAGIAN AUDIT DALAM & SIASATAN AWAM (BADSA)', :address=>'PERANAKAN',:telephone_number=>'012-345-5666', :is_active => 1)
#unit_user2 = Unit.create(:department_id => 1, :name => 'BAHAGIAN DEWAN DAN MMKN', :address=>'ST.PAUL HILL',:telephone_number=>'012-345-5777', :is_active => 1)
#unit_user3 = Unit.create(:department_id => 1, :name => 'UNIT KEWANGAN',:address=>'PULAU UPEH',:telephone_number=>'012-345-5888',  :is_active => 1)
#unit_user4 = Unit.create(:department_id => 1, :name => 'UNIT KERAJAAN TEMPATAN (KT)',:address=>'HARI MERDEKA',:telephone_number=>'012-345-5999',  :is_active => 1)
#
#puts "Creating Sample Units for the department JABATAN AGAMA ISLAM MELAKA"
#unit_user1 = Unit.create(:department_id => 4, :name => 'UNIT KEWANGAN AGAMA', :address=>'PERANAKAN',:telephone_number=>'012-345-6666', :is_active => 1)
#unit_user2 = Unit.create(:department_id => 4, :name => 'BAHAGIAN PERBADANAN KETUA MENTERI (CMI)',:address=>'ST.PAUL HILL',:telephone_number=>'012-345-6777', :is_active => 1)
#unit_user3 = Unit.create(:department_id => 4, :name => 'BAHAGIAN PERKHIDMATAN TEKNOLOGI MAKLUMAT (BPTM)',:address=>'PULAU UPEH',:telephone_number=>'012-345-6888', :is_active => 1)
#unit_user4 = Unit.create(:department_id => 4, :name => 'UNIT INTEGRITI',:address=>'HARI MERDEKA',:telephone_number=>'012-345-6999', :is_active => 1)
#
#puts "Creating Sample Units for the department JABATAN KERJA RAYA MELAKA"
#unit_user1 = Unit.create(:department_id => 6, :name => 'U ONE D SIX KERJA RAYA TEMPATAN (KT)',:address=>'PERANAKAN',:telephone_number=>'012-345-7666', :is_active => 1)
#unit_user2 = Unit.create(:department_id => 6, :name => 'U TWO D SIX KERJA RAYA TEMPATAN (KT)',:address=>'ST.PAUL HILL',:telephone_number=>'012-345-7777', :is_active => 1)
#unit_user3 = Unit.create(:department_id => 6, :name => 'U THREE D SIX KERJA RAYA TEMPATAN (KT)',:address=>'PULAU UPEH',:telephone_number=>'012-345-7888', :is_active => 1)
#unit_user4 = Unit.create(:department_id => 6, :name => 'U FOUR D SIX KERJA RAYA TEMPATAN (KT)',:address=>'HARI MERDEKA',:telephone_number=>'012-345-7999', :is_active => 1)
#
#puts "Creating Sample Units for the department JABATAN MUFTI NEGERI MELAKA"
#unit_user1 = Unit.create(:department_id => 8, :name => 'U ONE D EIGHT MUFTI NEGERI TEMPATAN (KT)',:address=>'PERANAKAN',:telephone_number=>'012-345-8666', :is_active => 1)
#unit_user2 = Unit.create(:department_id => 8, :name => 'U TWO D EIGHT MUFTI NEGERI TEMPATAN (KT)',:address=>'ST.PAUL HILL',:telephone_number=>'012-345-8777', :is_active => 1)
#unit_user3 = Unit.create(:department_id => 8, :name => 'U THREE D EIGHT MUFTI NEGERI TEMPATAN (KT)',:address=>'PULAU UPEH',:telephone_number=>'012-345-8888', :is_active => 1)
#unit_user4 = Unit.create(:department_id => 8, :name => 'U FOUR D EIGHT MUFTI NEGERI TEMPATAN (KT)',:address=>'HARI MERDEKA',:telephone_number=>'012-345-8999', :is_active => 1)


puts "Creating Super Admin"
super_admin = User.create(:ic_number => "123456781234",:contact_mobile => "9801498404", :email => 'manivannan.s@openwavecomp.in', :password => "password", :first_name => "openwave", :last_name => "superadmin",:username=>'Mani', :status => 'A', :state => 7, :sign_in_count => 1)
super_admin.activate_user
if super_admin.save!
  role_membership = RoleMembership.create(:user_id => super_admin.id, :role_id => 1, :status => 'A')
end

puts"Creating Sample Resource Manager for agency"
resource_manager1 = User.create(:ic_number => "123456780001", :contact_mobile => "9801498404",:email => 'sathisht@openwavecomp.in', :password => "password", :first_name => "James", :username => "James", :last_name => "Franklin", :status => 'A', :state => 7, :sign_in_count => 1)
resource_manager1.activate_user
rm_resource_manager1 = RoleMembership.create(:user_id => resource_manager1.id, :department_id => 1, :role_id => 5, :status => 'A', :default_dept=>true)

resource_manager2 = User.create(:ic_number => "123456780002", :contact_mobile => "9801498404", :email => 'sathish@openwavecomp.in', :password => "password", :first_name => "Sheik", :username => "Sheik", :last_name => "Sultan", :status => 'A', :state => 7, :sign_in_count => 1)
resource_manager2.activate_user
rm_resource_manager2 = RoleMembership.create(:user_id => resource_manager2.id, :department_id => 3, :role_id => 5, :status => 'A', :default_dept=>true)


puts"Creating Sample Datuk SUK"
Datuk_suk1 = User.create(:ic_number => "123456700001", :contact_mobile => "9801498404",:email => 'datuksuk@openwavecomp.in', :password => "password", :first_name => "Datuk", :username => "Datuk SUK", :last_name => "SUK", :status => 'A', :state => 7, :sign_in_count => 1)
Datuk_suk1.activate_user
rm_Datuk_suk1 = RoleMembership.create(:user_id => Datuk_suk1.id, :department_id => 1, :role_id => 6, :status => 'A', :default_dept=>true)

puts"Creating Sample SUK Deputy"
Suk_Deputy1 = User.create(:ic_number => "123456700011", :contact_mobile => "9801498404",:email => 'sukdeputy@openwavecomp.in', :password => "password", :first_name => "SUK", :username => "SUK Deputy", :last_name => "Deputy", :status => 'A', :state => 7, :sign_in_count => 1)
Suk_Deputy1.activate_user
rm_Suk_Deputy1 = RoleMembership.create(:user_id => Suk_Deputy1.id, :department_id => 1, :role_id => 7, :status => 'A', :default_dept=>true)

puts"Creating Sample HR"
hr_manager1 = User.create(:ic_number => "123456700111", :contact_mobile => "9801498404",:email => 'hrdept@openwavecomp.in', :password => "password", :first_name => "HR", :username => "Human Resource", :last_name => "HR", :status => 'A', :state => 7, :sign_in_count => 1)
hr_manager1.activate_user
rm_hr_manager1 = RoleMembership.create(:user_id => hr_manager1.id, :department_id => 1, :role_id => 8, :status => 'A', :default_dept=>true)

puts"Creating Sample Chief Minister"
chief_minister1 = User.create(:ic_number => "123456123456", :contact_mobile => "9801498404",:email => 'yab@openwavecomp.in', :password => "password", :first_name => "Y.A.B", :username => "Chief Minister", :last_name => "Minister", :status => 'A', :state => 7, :sign_in_count => 1)
chief_minister1.activate_user
rm_chief_minister1 = RoleMembership.create(:user_id => chief_minister1.id, :department_id => 1, :role_id => 9, :status => 'A', :default_dept=>true)


puts "Creating Sample Department Admins for the departments JABATAN KETUA MENTERI MELAKA, JABATAN AGAMA ISLAM MELAKA, JABATAN KERJA RAYA MELAKA, JABATAN MUFTI NEGERI MELAKA, JABATAN PERTANIAN NEGERI MELAKA, JABATAN KEBAJIKAN MASYARAKAT"
department_admin1 = User.create(:ic_number => "123456781111",:contact_mobile => "9801498404", :email => 'sathish.t@openwavecomp.in', :password => "password", :first_name => "Dept1Admin",  :last_name => "JKMM", :username=>'Sathish', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin1.activate_user
rm_department_admin1 = RoleMembership.create(:user_id => department_admin1.id, :department_id => 1, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin2 = User.create(:ic_number => "123456782222",:contact_mobile => "9801498404", :email => 'sheikdawood.a@openwavecomp.in', :password => "password", :first_name => "Dept2Admin", :last_name => "JMNM",:username=>'Sheik', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin2.activate_user
rm_department_admin2 = RoleMembership.create(:user_id => department_admin2.id, :department_id => 2, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin3 = User.create(:ic_number => "123456783333",:contact_mobile => "9801498404", :email => 'mathewvivek.a@openwavecomp.in', :password => "password", :first_name => "Dept3Admin", :last_name => "JAIM",:username=>'Mathew', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin3.activate_user
rm_department_admin3 = RoleMembership.create(:user_id => department_admin3.id, :department_id => 3, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin4 = User.create(:ic_number => "123456784444",:contact_mobile => "9801498404", :email => 'nirmala.a.b@openwavecomp.in', :password => "password", :first_name => "Dept4Admin", :last_name => "JKRM",:username=>'Nirmala', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin4.activate_user
rm_department_admin4 = RoleMembership.create(:user_id => department_admin4.id, :department_id => 4, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin5 = User.create(:ic_number => "123456785555",:contact_mobile => "9801498404", :email => 'sasitharan.t@openwavecomp.in', :password => "password", :first_name => "Dept5Admin", :last_name => "JPNM",:username=>'Sasitharan', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin5.activate_user
rm_department_admin5 = RoleMembership.create(:user_id => department_admin5.id, :department_id => 5, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin6 = User.create(:ic_number => "123456786666",:contact_mobile => "9801498404", :email => 'prakashkumar.m@openwavecomp.in', :password => "password", :first_name => "Dept6Admin", :last_name => "JKM",:username=>'Prakash', :status => 'A', :state => 7, :sign_in_count => 1)
department_admin6.activate_user
rm_department_admin6 = RoleMembership.create(:user_id => department_admin6.id, :department_id => 6, :role_id => 2, :status => 'A', :default_dept=>true)


puts "Creating Sample Department Users for JABATAN KETUA MENTERI MELAKA"
department_user1 = User.create(:ic_number => "123456781110", :contact_mobile => "9801498404",:email => 'testopen06@gmail.com', :password => "password", :first_name => "Dept1UserFirst", :last_name => "JKMM",:username=>'TestOpen06', :status => 'A', :state => 7, :sign_in_count => 1)
department_user1.activate_user
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 1, :role_id => 3,:status => 'A', :default_dept=>true)
department_user2 = User.create(:ic_number => "123456781120",:contact_mobile => "9801498404", :email => 'abuthahir.a.b@openwavecomp.in', :password => "password", :first_name => "Dept1UserSecond", :last_name => "JKMM",:username=>'Abuthahir', :status => 'A', :state => 7, :sign_in_count => 1)
department_user2.activate_user
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 1, :role_id => 3, :status => 'A', :default_dept=>true)
department_user3 = User.create(:ic_number => "123456781130",:contact_mobile => "9801498404", :email => 'testopen07@gmail.com', :password => "password", :first_name => "Dept1UserThird", :last_name => "JKMM",:username=>'TestOpen07', :status => 'A', :state => 7, :sign_in_count => 1)
department_user3.activate_user
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 1, :role_id => 3,:status => 'A', :default_dept=>true)


puts "Creating Sample Department Users for JABATAN MUFTI NEGERI MELAKA"
department_user4 = User.create(:ic_number => "123456782210",:contact_mobile => "9801498404", :email => 'anusudha.r@openwavecomp.in', :password => "password", :first_name => "Dept2Userfirst", :last_name => "JMNM",:username=>'Anu', :status => 'A', :state => 7, :sign_in_count => 1)
department_user4.activate_user
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 2, :role_id => 3, :status => 'A', :default_dept=>true)
department_user5 = User.create(:ic_number => "123456782220",:contact_mobile => "9801498404", :email => 'latha.k@openwavecomp.in', :password => "password", :first_name => "Dept2UserSecond", :last_name => "JMNM",:username=>'Latha', :status => 'A', :state => 7, :sign_in_count => 1)
department_user5.activate_user
rm_department_user5 = RoleMembership.create(:user_id => department_user5.id, :department_id => 2, :role_id => 3,  :status => 'A', :default_dept=>true)
department_user6 = User.create(:ic_number => "123456782230",:contact_mobile => "9801498404", :email => 'sakthivel.m@openwavecomp.in', :password => "password", :first_name => "Dept2UserThird", :last_name => "JMNM",:username=>'Sakthi', :status => 'A', :state => 7, :sign_in_count => 1)
department_user6.activate_user
rm_department_user6 = RoleMembership.create(:user_id => department_user6.id, :department_id => 2, :role_id => 3, :status => 'A', :default_dept=>true)


puts "Creating Sample Department Users for JABATAN AGAMA ISLAM MELAKA"
department_user7 = User.create(:ic_number => "123456783310",:contact_mobile => "9801498404", :email => 'gopinath.m@openwavecomp.in', :password => "password", :first_name => "Dept3Userfirst", :last_name => "JAIM",:username=>'Gopinath', :status => 'A', :state => 7, :sign_in_count => 1)
department_user7.activate_user
rm_department_user7 = RoleMembership.create(:user_id => department_user7.id, :department_id => 3, :role_id => 3, :status => 'A', :default_dept=>true)
department_user8 = User.create(:ic_number => "123456783320",:contact_mobile => "9801498404", :email => 'testopen01@gmail.com', :password => "password", :first_name => "Dept3UserSecond", :last_name => "JAIM",:username=>'TestOpen01', :status => 'A', :state => 7, :sign_in_count => 1)
department_user8.activate_user
rm_department_user8 = RoleMembership.create(:user_id => department_user8.id, :department_id => 3, :role_id => 3,  :status => 'A', :default_dept=>true)
department_user9 = User.create(:ic_number => "123456783330",:contact_mobile => "9801498404", :email => 'testopen02@gmail.com', :password => "password", :first_name => "Dept3UserThird", :last_name => "JAIM",:username=>'TestOpen02', :status => 'A', :state => 7, :sign_in_count => 1)
department_user9.activate_user
rm_department_user9 = RoleMembership.create(:user_id => department_user9.id, :department_id => 3, :role_id => 3, :status => 'A', :default_dept=>true)



puts "Creating Sample Department Users for JABATAN KERJA RAYA MELAKA"
department_user10 = User.create(:ic_number => "123456784410",:contact_mobile => "9801498404", :email => 'testopen03@gmail.com', :password => "password", :first_name => "Dept4Userfirst", :last_name => "JKRM",:username=>'TestOpen03', :status => 'A', :state => 7, :sign_in_count => 1)
department_user10.activate_user
rm_department_user10 = RoleMembership.create(:user_id => department_user10.id, :department_id => 4, :role_id => 3, :status => 'A', :default_dept=>true)
department_user11 = User.create(:ic_number => "123456784420",:contact_mobile => "9801498404", :email => 'testopen04@gmail.com', :password => "password", :first_name => "Dept4UserSecond", :last_name => "JKRM",:username=>'TestOpen04', :status => 'A', :state => 7, :sign_in_count => 1)
department_user11.activate_user
rm_department_user11 = RoleMembership.create(:user_id => department_user11.id, :department_id => 4, :role_id => 3,  :status => 'A', :default_dept=>true)
department_user12 = User.create(:ic_number => "123456784430",:contact_mobile => "9801498404", :email => 'testopen05@gmail.com', :password => "password", :first_name => "Dept4UserThird", :last_name => "JKRM",:username=>'TestOpen05', :status => 'A', :state => 7, :sign_in_count => 1)
department_user12.activate_user
rm_department_user12 = RoleMembership.create(:user_id => department_user12.id, :department_id => 4, :role_id => 3, :status => 'A', :default_dept=>true)


puts "Creating Sample Department Users for JABATAN PERTANIAN NEGERI MELAKA"
department_user13 = User.create(:ic_number => "123456785510",:contact_mobile => "9801498404", :email => 'testopen08@gmail.com', :password => "password", :first_name => "Dept5Userfirst", :last_name => "JPNM",:username=>'TestOpen08', :status => 'A', :state => 7, :sign_in_count => 1)
department_user13.activate_user
rm_department_user13 = RoleMembership.create(:user_id => department_user13.id, :department_id => 5, :role_id => 3, :status => 'A', :default_dept=>true)
department_user14 = User.create(:ic_number => "123456785520", :contact_mobile => "9801498404",:email => 'testopen09@gmail.com', :password => "password", :first_name => "Dept5UserSecond", :last_name => "JPNM",:username=>'TestOpen09', :status => 'A', :state => 7, :sign_in_count => 1)
department_user14.activate_user
rm_department_user14 = RoleMembership.create(:user_id => department_user14.id, :department_id => 5, :role_id => 3,  :status => 'A', :default_dept=>true)
department_user15 = User.create(:ic_number => "123456785530",:contact_mobile => "9801498404", :email => 'john.poul01@gmail.com', :password => "password", :first_name => "Dept5UserThird", :last_name => "JPNM",:username=>'JohnPoul01', :status => 'A', :state => 7, :sign_in_count => 1)
department_user15.activate_user
rm_department_user15 = RoleMembership.create(:user_id => department_user15.id, :department_id => 5, :role_id => 3, :status => 'A', :default_dept=>true)








puts "Creating Sample Department Users for JABATAN KETUA MENTERI MELAKA"
department_user1 = User.create(:ic_number => "123456781110", :contact_mobile => "9801498404",:email => 'testopen06@gmail.com', :password => "password", :first_name => "Dept1UserFirst", :last_name => "JKMM",:username=>'TestOpen06', :status => 'A', :state => 7, :sign_in_count => 1)
department_user1.activate_user
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 1, :role_id => 3,:status => 'A', :default_dept=>true)

department_user2 = User.create(:ic_number => "123456781120",:contact_mobile => "9801498404", :email => 'abuthahir.a.b@openwavecomp.in', :password => "password", :first_name => "Dept1UserSecond", :last_name => "JKMM",:username=>'Abuthahir', :status => 'A', :state => 7, :sign_in_count => 1)
department_user2.activate_user
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 1, :role_id => 3, :status => 'A', :default_dept=>true)

department_user3 = User.create(:ic_number => "123456781130",:contact_mobile => "9801498404", :email => 'testopen07@gmail.com', :password => "password", :first_name => "Dept1UserThird", :last_name => "JKMM",:username=>'TestOpen07', :status => 'A', :state => 7, :sign_in_count => 1)
department_user3.activate_user
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 1, :role_id => 3,:status => 'A', :default_dept=>true)

#Prakash Users

department_user19 = User.create(:ic_number => "100000000000",:contact_mobile => "9888888888", :email => 'prakashtest01@gmail.com', :password => "123456789", :first_name => "Prakash DA1", :last_name => "Muthu DA1",:username=>'Prakash DA One', :status => 'A', :state => 7, :sign_in_count => 1)
department_user19.activate_user
rm_department_user19 = RoleMembership.create(:user_id => department_user19.id, :department_id => 12, :role_id => 2, :status => 'A', :default_dept=>true)

department_user20 = User.create(:ic_number => "200000000000",:contact_mobile => "9888888881", :email => 'prakashtest02@gmail.com', :password => "123456789", :first_name => "Prakash DA2", :last_name => "Muthu DA2",:username=>'Prakash DA Two', :status => 'A', :state => 7, :sign_in_count => 1)
department_user20.activate_user
rm_department_user20 = RoleMembership.create(:user_id => department_user20.id, :department_id => 2, :role_id => 2, :status => 'A', :default_dept=>true)

department_user21 = User.create(:ic_number => "300000000000",:contact_mobile => "9888888188", :email => 'prakashtest03@gmail.com', :password => "123456789", :first_name => "Prakash DA3", :last_name => "Muthu DA3",:username=>'Prakash DA Three', :status => 'A', :state => 7, :sign_in_count => 1)
department_user21.activate_user
rm_department_user21 = RoleMembership.create(:user_id => department_user21.id, :department_id => 13, :role_id => 2, :status => 'A', :default_dept=>true)


department_user22 = User.create(:ic_number => "100000001111",:contact_mobile => "9888888388", :email => 'prakashtest04@gmail.com', :password => "123456789", :first_name => "Prakash DU1", :last_name => "Muthu DU1",:username=>'Prakash DU One', :status => 'A', :state => 7, :sign_in_count => 1)
department_user22.activate_user
rm_department_user22 = RoleMembership.create(:user_id => department_user22.id, :department_id => 12, :role_id => 3, :status => 'A', :default_dept=>true)

department_user23 = User.create(:ic_number => "100000002222",:contact_mobile => "9888888848", :email => 'prakashtest05@gmail.com', :password => "123456789", :first_name => "Prakash DU2", :last_name => "Muthu DU2",:username=>'Prakash DU Two', :status => 'A', :state => 7, :sign_in_count => 1)
department_user23.activate_user
rm_department_user23 = RoleMembership.create(:user_id => department_user23.id, :department_id => 12, :role_id => 3, :status => 'A', :default_dept=>true)


department_user24 = User.create(:ic_number => "200000001111",:contact_mobile => "9888888588", :email => 'prakashtest06@gmail.com', :password => "123456789", :first_name => "Prakash DU3", :last_name => "Muthu DU3",:username=>'Prakash DU Three', :status => 'A', :state => 7, :sign_in_count => 1)
department_user24.activate_user
rm_department_user24 = RoleMembership.create(:user_id => department_user24.id, :department_id => 8  , :role_id => 3, :status => 'A', :default_dept=>true)

department_user25 = User.create(:ic_number => "300001231111",:contact_mobile => "9888888688", :email => 'prakashtest078@gmail.com', :password => "123456789", :first_name => "Prakash DU444", :last_name => "Muthu DU4",:username=>'Prakash DU Fourth44', :status => 'A', :state => 7, :sign_in_count => 1)
department_user25.activate_user
rm_department_user25 = RoleMembership.create(:user_id => department_user25.id, :department_id => 13, :role_id => 3, :status => 'A', :default_dept=>true)

department_user26 = User.create(:ic_number => "300000001111",:contact_mobile => "9888788888", :email => 'prakashtest07@gmail.com', :password => "123456789", :first_name => "Prakash DU4", :last_name => "Muthu DU2",:username=>'Prakash DU Fourth', :status => 'A', :state => 7, :sign_in_count => 1)
department_user26.activate_user
rm_department_user26 = RoleMembership.create(:user_id => department_user26.id, :department_id => 13, :role_id => 3, :status => 'A', :default_dept=>true)

department_user27 = User.create(:ic_number => "100000000011",:contact_mobile => "9888868888", :email => 'prakashtest08@gmail.com', :password => "123456789", :first_name => "Prakash RM1", :last_name => "Muthu RM1",:username=>'Prakash RM One', :status => 'A', :state => 7, :sign_in_count => 1)
department_user27.activate_user
rm_department_user27 = RoleMembership.create(:user_id => department_user27.id, :department_id => 12, :role_id => 5, :status => 'A', :default_dept=>true)

department_user28 = User.create(:ic_number => "100000000022",:contact_mobile => "9888888788", :email => 'prakashtest09@gmail.com', :password => "123456789", :first_name => "Prakash RM2", :last_name => "Muthu DA2",:username=>'Prakash RM Two', :status => 'A', :state => 7, :sign_in_count => 1)
department_user28.activate_user
rm_department_user28 = RoleMembership.create(:user_id => department_user28.id, :department_id => 13, :role_id => 5, :status => 'A', :default_dept=>true)

department_user29 = User.create(:ic_number => "100000003333",:contact_mobile => "9888888988", :email => 'prakashtest10@gmail.com', :password => "123456789", :first_name => "Prakash DU5", :last_name => "Muthu DU5",:username=>'Prakash DU Five', :status => 'A', :state => 7, :sign_in_count => 1)
department_user29.activate_user
rm_department_user29 = RoleMembership.create(:user_id => department_user29.id, :department_id => 12, :role_id => 3, :status => 'A', :default_dept=>true)


puts "Creating Sample Department Users for JABATAN KEBAJIKAN MASYARAKAT"
department_user16 = User.create(:ic_number => "123456786610",:contact_mobile => "9801498404", :email => 'john.poul02@gmail.com', :password => "password", :first_name => "Dept6Userfirst", :last_name => "JKM",:username=>'JohnPoul02', :status => 'A', :state => 7, :sign_in_count => 1)
department_user16.activate_user
rm_department_user16 = RoleMembership.create(:user_id => department_user16.id, :department_id => 6, :role_id => 3, :status => 'A', :default_dept=>true)
department_user17 = User.create(:ic_number => "123456786620",:contact_mobile => "9801498404", :email => 'john.poul03@gmail.com', :password => "password", :first_name => "Dept6UserSecond", :last_name => "JKM",:username=>'JohnPoul03', :status => 'A', :state => 7, :sign_in_count => 1)
department_user17.activate_user
rm_department_user17 = RoleMembership.create(:user_id => department_user17.id, :department_id => 6, :role_id => 3,  :status => 'A', :default_dept=>true)
department_user18 = User.create(:ic_number => "123456786630",:contact_mobile => "9801498404", :email => 'john.poul04@gmail.com', :password => "password", :first_name => "Dept6UserThird", :last_name => "JKM",:username=>'JohnPoul04', :status => 'A', :state => 7, :sign_in_count => 1)
department_user18.activate_user
rm_department_user18 = RoleMembership.create(:user_id => department_user18.id, :department_id => 6, :role_id => 3, :status => 'A', :default_dept=>true)


puts "Creating sample resources for a resources category"
categories=['Stationery Item','Computer Hardware and Accessories','Computer Software', 'Communications','Office Furniture and Equipment','Room','Transportation', 'ICT Equipment']
categories.each do |category|
  Category.create(:name=>category)
end

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

puts "Creating Sample sub resource category for a Room category"
resource_sub_categories1 = SubCategory.create(:category_id => 6, :name => "Conference room")
resource_sub_categories2 = SubCategory.create(:category_id => 6, :name => "Prayer room")
resource_sub_categories2 = SubCategory.create(:category_id => 6, :name => "Dining room")
resource_sub_categories2 = SubCategory.create(:category_id => 6, :name => "Party hall")

puts "Creating Sample sub resource category for a transportation category"
resource_sub_categories1 = SubCategory.create(:category_id => 7, :name => "Kerata", :is_available => false)
resource_sub_categories2 = SubCategory.create(:category_id => 7, :name => "Van",  :is_available => false)
resource_sub_categories2 = SubCategory.create(:category_id => 7, :name => "MPV",  :is_available => false)
resource_sub_categories2 = SubCategory.create(:category_id => 7, :name => "4WD", :is_available => false)
resource_sub_categories2 = SubCategory.create(:category_id => 7, :name => "Bas", :is_available => false)
resource_sub_categories2 = SubCategory.create(:category_id => 7, :name => "Lori", :is_available => false)

p "Creating Sample sub category data for ICT Equipment category"
begin
  file = File.open("public/equipment_category.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      SubCategory.create(:category_id => 8 ,:name=>record)
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
      Vehicle.create(:registration_id=>record_split[0],:registration_number=>record_split[1],:vehicle_type_id=>record_split[2],:driver_id=>i+1,:model_name=>record_split[3],:registration_date=>record_split[4])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end


p "Creating Equipment Category for Resource ICT Equipment"

begin
  file = File.open("public/equipment_category.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      EquipmentCategory.create(:name=>record ,:is_active=>true)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Requisition Types"

begin
  file = File.open("public/Requisition_Types.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      RequisitionType.create(:name=>record,:is_active=>true)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Facility Ict Agencies"

begin
  file = File.open("public/Facility_Ict_Agencies.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      FacilityIctAgency.create(:name=>record,:is_active=>true)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Facility Ict Softwares"

begin
  file = File.open("public/Facility_Ict_Softwares.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      FacilityIctSoftware.create(:name=>record,:is_active=>true)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Facility Ict Wirings"

begin
  file = File.open("public/Facility_Ict_Wirings.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      FacilityIctWiring.create(:name=>record,:is_active=>true)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Facility Ict Services"

begin
  file = File.open("public/Facility_Ict_Services.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      FacilityIctService.create(:name=>record_split[0],:port=>record_split[1],:is_active=>true)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Facility Ict Hardwares"

begin
  file = File.open("public/Facility_Ict_Hardwares.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      FacilityIctHardware.create(:name=>record,:is_active=>true)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Facility Ict Servers"

FacilityIctServer.create(:name=>'Tun Razak 1',:ip=>'172.10.10.172')
FacilityIctServer.create(:name=>'Tun Razak 2',:ip=>'172.10.10.173')

p "Creating System Accesses"

begin
  file = File.open("public/System_Access.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      SystemAccess.create(:name=>record_split[0], :is_active=>true, :complaint_type_id=>record_split[1])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Facility ICT"

begin
  file = File.open("public/facility_ict.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      FacilityIct.create(:name=>record)
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

puts "Creating Damage Types"
damage_type1 = DamageType.create(:name => 'Building', :parent_type_id => 0, :building_asset_type_id => 1)
damage_type2 = DamageType.create(:name => 'Asset', :parent_type_id => 0, :building_asset_type_id => 34)
damage_type3 = DamageType.create(:name => 'Cleanliness', :parent_type_id => 0, :building_asset_type_id => 40)
damage_type4 = DamageType.create(:name => 'Mechanical', :parent_type_id => 1, :building_asset_type_id => 2)
damage_type5 = DamageType.create(:name => 'Electrical', :parent_type_id => 1, :building_asset_type_id => 3)
damage_type6 = DamageType.create(:name => 'Civil', :parent_type_id => 1, :building_asset_type_id => 35)


p "Creating Building Asset Types"

begin
  file = File.open("public/Building_Asset_Type.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
       record_split = record.split(",")
      BuildingAssetType.create(:name=>record_split[0], :parent_type_id=>record_split[1])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end


p "Creating System Model Types"

begin
  file = File.open("public/System_Model_Types.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      SystemModelType.create(:name=>record_split[0], :system_access_id=>record_split[1])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end


p "Creating Complaint Types"

begin
  file = File.open("public/Complaint_Types.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      ComplaintType.create(:name=>record_split[0])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

p "Creating Vehicle Models"

begin
  file = File.open("public/VehicleModel.csv", "r")
  file.readlines.each_with_index do |record, i|
    begin
      record_split = record.split(",")
      VehicleModelType.create(:name=>record_split[0],:sub_category_id=>record_split[1])
    rescue Exception =>e
      p "Exception ocurred due to #{e.to_s} at #{i}"
    end
  end
rescue Exception=>e
  p "Exception due to : #{e.to_s}"
end

puts "Whoa, im done! Now you can run the server and see the application"
