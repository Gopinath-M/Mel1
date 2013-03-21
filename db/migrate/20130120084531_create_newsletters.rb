class CreateNewsletters < ActiveRecord::Migration
  def self.up
    create_table :newsletters do |t|
      t.string :from
      t.text :to
      t.integer :created_by
      t.string :subject
      t.text :content
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletters
  end
end
