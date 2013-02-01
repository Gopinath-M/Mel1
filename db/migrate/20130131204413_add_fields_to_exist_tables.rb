class AddFieldsToExistTables < ActiveRecord::Migration
  def self.up
    add_column  :message_comments, :deleted, :boolean, :default => false
  end

  def self.down
    remove_column  :message_comments, :deleted
  end
end
