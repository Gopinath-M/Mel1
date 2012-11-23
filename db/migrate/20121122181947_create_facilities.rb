class CreateFacilities < ActiveRecord::Migration
  def self.up
    create_table :facilities do |t|
      t.string :resource_type
      t.integer :room_id
      t.integer :vehicle_id
      t.integer :ict_id
      t.text :name
      t.integer :total_qty
      t.integer :booked_qty
      t.boolean :is_active
      t.timestamps
    end
  end

  def self.down
    drop_table :facilities
  end
end
