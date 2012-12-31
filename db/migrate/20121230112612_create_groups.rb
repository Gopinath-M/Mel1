class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.string :name
      t.references :user
      t.string :department_id 
      t.boolean :is_active, :default => true
      t.boolean :deleted, :default => false     
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
