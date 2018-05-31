class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.references :admin, index: true, foreign_key: true
      t.string :email

      t.timestamps null: false
    end
  end
end
