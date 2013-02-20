class AddDesignationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :designation, :string
  end

  def self.down
    remove_column :users, :designation, :string
  end
end
