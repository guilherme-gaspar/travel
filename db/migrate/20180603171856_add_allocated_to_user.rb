class AddAllocatedToUser < ActiveRecord::Migration
  def change
    add_column :users, :allocated, :integer, :default => 0 # 1 é alocado, 0 é desalocado
  end
end
