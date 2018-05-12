class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :due_date
      t.integer :number_installments
      t.references :user, index: true, foreign_key: true
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
