class CreateRoleMemberships < ActiveRecord::Migration
  def self.up
    create_table :role_memberships do |t|
      t.references :role, :user, :department
      t.string :designation
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :role_memberships
  end
end
