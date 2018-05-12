class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :contract, index: true, foreign_key: true
      t.date :due_date

      t.timestamps null: false
    end
  end
end
