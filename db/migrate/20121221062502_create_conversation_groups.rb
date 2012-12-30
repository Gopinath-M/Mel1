class CreateConversationGroups < ActiveRecord::Migration
  def self.up
    create_table :conversation_groups do |t|

      t.integer :from_groupid
      t.integer :to_groupid
      t.integer :from_userid
      t.integer :to_userid
      t.references :department
      t.references :user
      t.text :content
      t.timestamps
    end
  end

  def self.down
    drop_table :conversation_groups
  end
end
