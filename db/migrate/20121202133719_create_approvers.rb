class CreateApprovers < ActiveRecord::Migration
  def self.up
    create_table :approvers do |t|
      t.references :user
      t.references :department
      t.boolean :is_active
      t.timestamps
    end
  end

  def self.down
    drop_table :approvers
  end
end
