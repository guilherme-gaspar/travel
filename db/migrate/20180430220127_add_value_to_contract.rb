class AddValueToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :value, :float
  end
end
