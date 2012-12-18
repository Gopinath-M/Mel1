class CreateDeclarationProperties < ActiveRecord::Migration
  def self.up
    create_table :declaration_properties do |t|
      t.references :user
      t.string :property_file
      t.integer :property_year
      t.timestamps
    end
  end

  def self.down
    drop_table :declaration_properties
  end
end
