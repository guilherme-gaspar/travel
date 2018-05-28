class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :description
      t.date :notification_date
      t.references :admin, index: true, foreign_key: true
      t.references :university, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
