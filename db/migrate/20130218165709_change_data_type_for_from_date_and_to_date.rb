class ChangeDataTypeForFromDateAndToDate < ActiveRecord::Migration
  def self.up
    change_table :outstations do |t|
      t.change :from_date, :date
      t.change :to_date, :date
    end
  end

  def self.down
    change_table :outstations do |t|
      t.change :from_date, :date
      t.change :to_date, :date
    end
  end
end
