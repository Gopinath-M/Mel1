class CreateApplicationStatuses < ActiveRecord::Migration
  def self.up
    create_table :application_statuses do |t|
      t.string  :module_name
      t.string  :module_type
      t.integer :module_resource_id
      t.string  :status
      t.string  :remarks
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
  end

  def self.down
    drop_table :application_statuses
  end
end
