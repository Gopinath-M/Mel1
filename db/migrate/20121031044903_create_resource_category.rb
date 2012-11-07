class CreateResourceCategory < ActiveRecord::Migration
  def self.up
    create_table :resource_categories do |t|
      t.string :name
      t.boolean :is_active
      t.boolean :deleted, :default => false
      t.integer :created_by
      t.timestamps
    end
  end

  def self.down
	   drop_table :resource_categories
  end
end
