class CreateGroupMembers < ActiveRecord::Migration
  def self.up
    create_table :group_members do |t|
      t.references :group
      t.string :user_id
      t.boolean :is_active, :default => true
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :group_members
  end
end
