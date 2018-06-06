class AddAvailableToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :available, :integer, :default => 1 # 1 é disponivel 0 é indisponivel
  end
end
