class AddOriginToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :origin, :string
  end
end
