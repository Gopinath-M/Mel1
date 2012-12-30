class CreateAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|
      t.string :web_link
      t.datetime :from_date
      t.datetime :to_date
      t.integer :created_by
      t.integer :updated_by
      t.string :advertisement_attachment
      t.boolean :is_active, :default => true
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :advertisements
  end
end
