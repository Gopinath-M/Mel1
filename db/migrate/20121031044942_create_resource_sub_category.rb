class CreateResourceSubCategory < ActiveRecord::Migration
  def self.up
  create_table :resource_sub_categories do |t|
      t.string :name
      t.references :resource_category
      t.boolean :is_active
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
	  drop_table :resource_sub_categories
  end
end
