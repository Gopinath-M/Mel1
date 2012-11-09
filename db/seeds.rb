# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

puts "All right! I have started seeding, now please be patient."

puts "Creating Agencies"
agency1 = Agency.create(:name => 'Agency_one', :is_active => true)
agency2 = Agency.create(:name => 'Agency_two', :is_active => false)

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


puts "Creating Super Admin"
super_admin = User.create(:ic_number => "123456781234", :email => 'manivannan.s@openwavecomp.in', :password => "password", :first_name => "openwave", :last_name => "superadmin", :status => 'A', :state => 7, :sign_in_count => 1)
super_admin.activate_user
if super_admin.save!
  role_membership = RoleMembership.create(:user_id => super_admin.id, :role_id => 1, :status => 'A')
end

puts "Creating Sample Department Admins for the departments JABATAN KETUA MENTERI MELAKA and JABATAN AGAMA ISLAM MELAKA"
department_admin1 = User.create(:ic_number => "123456781111", :email => 'sathish.t@openwavecomp.in', :password => "password", :first_name => "DeptAdmin", :last_name => "JKMM", :status => 'A', :state => 7, :sign_in_count => 1)
department_admin1.activate_user
rm_department_admin1 = RoleMembership.create(:user_id => department_admin1.id, :department_id => 1, :role_id => 2, :status => 'A', :default_dept=>true)
department_admin2 = User.create(:ic_number => "123456782222", :email => 'sheikdawood.a@openwavecomp.in', :password => "password", :first_name => "DeptAdmin", :last_name => "JAIM", :status => 'A', :state => 7, :sign_in_count => 1)
department_admin2.activate_user
rm_department_admin2 = RoleMembership.create(:user_id => department_admin2.id, :department_id => 4, :role_id => 2, :status => 'A', :default_dept=>true)


puts "Creating Sample Department Users for JABATAN KETUA MENTERI MELAKA"
department_user1 = User.create(:ic_number => "123456781222", :email => 'sasitharan.t@openwavecomp.in', :password => "password", :first_name => "DeptUserfirst", :last_name => "JKMM", :status => 'A', :state => 7, :sign_in_count => 1)
department_user1.activate_user
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 1, :role_id => 3,:unit_id=>1, :status => 'A', :default_dept=>true)
department_user2 = User.create(:ic_number => "123456781333", :email => 'nirmala.a.b@openwavecomp.in', :password => "password", :first_name => "DeptUserSecond", :last_name => "JKMM", :status => 'A', :state => 7, :sign_in_count => 1)
department_user2.activate_user
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 1, :role_id => 3, :unit_id=>2,:status => 'A', :default_dept=>true)
department_user3 = User.create(:ic_number => "123456781444", :email => 'prakashkumar.m@openwavecomp.in', :password => "password", :first_name => "DeptUserThird", :last_name => "JKMM", :status => 'A', :state => 7, :sign_in_count => 1)
department_user3.activate_user
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 1, :role_id => 3, :unit_id=>3,:status => 'A', :default_dept=>true)
department_user4 = User.create(:ic_number => "123456781555", :email => 'abuthahir.a.h@openwavecomp.in', :password => "password", :first_name => "DeptUserFour", :last_name => "JKMM", :status => 'A', :state => 7, :sign_in_count => 1)
department_user4.activate_user
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 1, :role_id => 3, :unit_id=>4,:status => 'A', :default_dept=>true)

puts "Creating Sample Department Users for JABATAN AGAMA ISLAM MELAKA"
department_user1 = User.create(:ic_number => "123456782222", :email => 'anusudha.r@openwavecomp.in', :password => "password", :first_name => "DeptUserfirst", :last_name => "JAIM", :status => 'A', :state => 7, :sign_in_count => 1)
department_user1.activate_user
rm_department_user1 = RoleMembership.create(:user_id => department_user1.id, :department_id => 4, :role_id => 3, :unit_id=>5,:status => 'A', :default_dept=>true)
department_user2 = User.create(:ic_number => "123456782333", :email => 'latha.k@openwavecomp.in', :password => "password", :first_name => "DeptUserSecond", :last_name => "JAIM", :status => 'A', :state => 7, :sign_in_count => 1)
department_user2.activate_user
rm_department_user2 = RoleMembership.create(:user_id => department_user2.id, :department_id => 4, :role_id => 3, :unit_id=>6, :status => 'A', :default_dept=>true)
department_user3 = User.create(:ic_number => "123456782444", :email => 'sakthivel.m@openwavecomp.in', :password => "password", :first_name => "DeptUserThird", :last_name => "JAIM", :status => 'A', :state => 7, :sign_in_count => 1)
department_user3.activate_user
rm_department_user3 = RoleMembership.create(:user_id => department_user3.id, :department_id => 4, :role_id => 3, :unit_id=>5, :status => 'A', :default_dept=>true)
department_user4 = User.create(:ic_number => "123456782555", :email => 'gopinath.m@openwavecomp.in', :password => "password", :first_name => "DeptUserFour", :last_name => "JAIM", :status => 'A', :state => 15, :sign_in_count => 1)
department_user4.activate_user
rm_department_user4 = RoleMembership.create(:user_id => department_user4.id, :department_id => 4, :role_id => 3, :unit_id=>6, :status => 'A', :default_dept=>true)

puts "Creating sample resources for a resources category"
resource_categories1 = Category.create( :name => 'Stationery Item')
resource_categories2 = Category.create( :name => 'Computer Hardware and Accessories')
resource_categories3 = Category.create(:name => 'Computer Software')
#resource_categories4 = Category.create(:category_id => 4, :name => 'canteen')
resource_categories4 = Category.create( :name => 'Communications')
#resource_categories1 = Category.create(:category_id => 6, :name => 'first aid kit')
resource_categories5 = Category.create( :name => 'Office Furniture and Equipment')

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

puts "Whoa, im done! Now you can run the server and see the application"
