class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.string :name
      t.string :template_type
      t.text :content
      t.integer :department_id
      t.integer :user_id
      t.string :interested_objects
      t.string :subject
      t.timestamps
    end
  end

  def self.down
    drop_table :templates
  end
end
