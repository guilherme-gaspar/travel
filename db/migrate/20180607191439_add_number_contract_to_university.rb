class AddNumberContractToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :number_contract, :string
  end
end
