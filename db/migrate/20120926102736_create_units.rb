class CreateUnits < ActiveRecord::Migration
  def self.up
    create_table :units do |t|
      t.string :name
      t.references :department
      t.integer :order_by
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :units
  end
end
