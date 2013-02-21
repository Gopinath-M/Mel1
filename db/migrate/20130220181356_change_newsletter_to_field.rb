class ChangeNewsletterToField < ActiveRecord::Migration
  def self.up
    change_table :newsletters do |t|
      t.change :to, :text
    end
  end

  def self.down
    change_table :newsletters do |t|
      t.change :to, :text
    end
  end
end
