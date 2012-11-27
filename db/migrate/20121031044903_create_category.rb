class CreateCategory < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.boolean :is_active, :default => true
      t.boolean :deleted, :default => false
      t.integer :created_by
      t.timestamps
    end
  end

  def self.down
	   drop_table :categories
  end
end
