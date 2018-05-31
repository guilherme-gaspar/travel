class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.references :driver, index: true, foreign_key: true
      t.references :admin, index: true, foreign_key: true
      t.references :university, index: true, foreign_key: true
      t.references :car, index: true, foreign_key: true
      t.string :origin
      t.string :period_day

      t.timestamps null: false
    end
  end
end
