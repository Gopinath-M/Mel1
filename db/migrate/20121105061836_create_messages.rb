class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :subject
      t.text :message
      t.string :sender
      t.string :message_type
      t.string :agency_id
      t.string :department_id 
      t.boolean :send_to_dept_admins, :default => false     
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
