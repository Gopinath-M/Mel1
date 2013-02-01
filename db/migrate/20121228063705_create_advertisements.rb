class CreateAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|
      t.string :web_link
      t.datetime :from_date
      t.datetime :to_date
      t.string :advertisement_attachment
      t.string :advertisement_attachment_cache
      t.boolean :is_active, :default => true
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :advertisements
  end
end
