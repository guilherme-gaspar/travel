class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.references :route, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
