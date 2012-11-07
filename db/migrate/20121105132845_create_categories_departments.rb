class CreateCategoriesDepartments < ActiveRecord::Migration
  def self.up
    create_table :categories_departments do |t|
      t.references :category
      t.references :department
      t.integer :created_by
      t.timestamps
    end
  end

  def self.down
    drop_table :categories_departments
  end
end
