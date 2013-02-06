class AddingAllotedBooleanInResources < ActiveRecord::Migration
  def self.up
    add_column  :resources,:alloted,:boolean,:default=>false
  end

  def self.down
    remove_column :resources, :alloted
  end
end
