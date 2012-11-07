class CreateDeptCategories < ActiveRecord::Migration
  def self.up
    create_table :dept_categories do |t|
      t.references :resource_category
#      t.references :resource_sub_category
      t.references :department
      t.integer :created_by
      t.timestamps
    end
  end

  def self.down
    drop_table :dept_categories
  end
end
