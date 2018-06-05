class AddAvailableToCar < ActiveRecord::Migration
  def change
    add_column :cars, :available, :integer, :default => 1 # 1 é disponivel 0 é indisponivel
  end
end
