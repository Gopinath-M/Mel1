class CreateSubCategory < ActiveRecord::Migration
  def self.up
  create_table :sub_categories do |t|
      t.string :name
      t.references :category
      t.boolean :is_active
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
	  drop_table :sub_categories
  end
end
