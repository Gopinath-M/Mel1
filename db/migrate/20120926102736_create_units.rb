class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.integer :office_id
      t.string :name
      t.integer :order_by
      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
