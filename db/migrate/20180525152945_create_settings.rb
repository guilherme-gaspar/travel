class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :token
      t.integer :days_for_payment
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
