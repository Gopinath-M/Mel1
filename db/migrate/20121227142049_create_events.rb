class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.datetime :from_date
      t.datetime :to_date
      t.string :venue
      t.string :organizer
      t.text :description
      t.string :event_attachment
      t.string :event_attachment_cache
      t.boolean :is_active, :default => true
      t.boolean :deleted, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
