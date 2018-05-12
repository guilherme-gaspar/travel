class CreateFastTravels < ActiveRecord::Migration
  def change
    create_table :fast_travels do |t|
      t.string :name
      t.integer :number_passenger
      t.string :email
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
