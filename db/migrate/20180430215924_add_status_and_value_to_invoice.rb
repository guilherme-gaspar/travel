class AddStatusAndValueToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :status, :integer
    add_column :invoices, :value, :float
  end
end
