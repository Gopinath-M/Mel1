class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.string :name
      t.string :remarks
      t.boolean :is_active
      t.text :address
      t.text :email
      t.string :contact_no
#      t.string :vendor_type
      t.timestamps
    end
  end

  def self.down
    drop_table :vendors
  end
end
