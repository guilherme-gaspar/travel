class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.date :skip_day
      t.references :user, index: true, foreign_key: true
      t.string :skip_period
      t.string :description

      t.timestamps null: false
    end
  end
end
