class CreateCategoriesDepartments < ActiveRecord::Migration
  def self.up
    create_table :categories_departments, :id => false do |t|
      t.integer :category_id
      t.integer :department_id
      t.integer :created_by
      t.boolean :is_active
      t.timestamps
    end
  end

  def self.down
    drop_table :categories_departments
  end
end
