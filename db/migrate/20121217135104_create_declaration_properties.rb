class CreateDeclarationProperties < ActiveRecord::Migration
  def self.up
    create_table :declaration_properties do |t|
      t.references :user
      t.string :property_file
      t.string :property_file1
      t.string :property_file2
      t.string :property_file3
      t.string :property_file4
      t.integer :property_year
      t.timestamps
    end
  end

  def self.down
    drop_table :declaration_properties
  end
end
