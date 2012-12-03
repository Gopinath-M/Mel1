class CreateRequisitionTypes < ActiveRecord::Migration
  def self.up
    create_table :requisition_types do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :requisition_types
  end
end
