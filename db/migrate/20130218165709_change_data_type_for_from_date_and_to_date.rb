class ChangeDataTypeForFromDateAndToDate < ActiveRecord::Migration
  def self.up
    remove_column :outstations , :from_date
    remove_column :outstations , :to_date
    add_column :outstations , :from_date, :date
    add_column :outstations , :to_date, :date

    #    change_table :outstations do |t|
    #      t.change :from_date, :date
    #      t.change :to_date, :date
    #    end
  end

  def self.down
    remove_column :outstations , :from_date
    remove_column :outstations , :to_date
    add_column :outstations , :from_date, :date
    add_column :outstations , :to_date, :date
    #    change_table :outstations do |t|
    #      t.change :from_date, :date
    #      t.change :to_date, :date
    #    end
  end
end
