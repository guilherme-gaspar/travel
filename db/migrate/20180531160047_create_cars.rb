class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :capacity
      t.string :plate
      t.references :admin, index: true, foreign_key: true
      t.string :model
      t.integer :year
      t.string :mark

      t.timestamps null: false
    end
  end
end
