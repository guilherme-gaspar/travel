class AddAllocatedToUser < ActiveRecord::Migration
  def change
    add_column :users, :allocated, :integer, :default => 0
  end
end
