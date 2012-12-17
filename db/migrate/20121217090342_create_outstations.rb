class CreateOutstations < ActiveRecord::Migration
  def self.up
    create_table :outstations do |t|
      t.boolean :is_out_of_state
      t.boolean :is_official
      t.string :placename
      t.string :state
      t.string :country
      t.date :from_date
      t.date :to_date
      t.string :user_id
      t.string :purpose
      t.integer :total_expenditure
      t.string :cause_spending
      t.string :attachment
      t.timestamps
    end
  end

  def self.down
    drop_table :outstations
  end
end
