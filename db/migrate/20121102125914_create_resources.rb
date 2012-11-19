class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :name
      t.references :category
      t.references :sub_category
      t.references :department 
      t.string :status
      t.text :description
      t.string :resource_type
      t.string :status
      t.boolean :is_returnable
      t.integer :created_by
      t.boolean :is_active, :default => true
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
