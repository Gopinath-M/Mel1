class CreateSystemAccesses < ActiveRecord::Migration
  def self.up
    create_table :system_accesses do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :system_accesses
  end
end