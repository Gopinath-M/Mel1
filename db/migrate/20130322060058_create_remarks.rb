class CreateRemarks < ActiveRecord::Migration
  def self.up
    create_table :remarks do |t|
      t.string :text
      t.string :status
      t.references :user
      t.references :department
      t.references :agency
      t.references :remarkable, :polymorphic=>true
      t.timestamps
    end
  end

  def self.down
    drop_table :remarks
  end
end
