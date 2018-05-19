class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.string :mond
      t.string :tues
      t.string :wedn
      t.string :thur
      t.string :frid
      t.string :satu
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
