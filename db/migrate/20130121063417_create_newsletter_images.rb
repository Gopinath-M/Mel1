class CreateNewsletterImages < ActiveRecord::Migration
  def self.up
    create_table :newsletter_images do |t|
      t.string :image
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_images
  end
end
