class AddNameAndCityAndStreetAndNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :city, :string
    add_column :users, :street, :string
    add_column :users, :number, :string
  end
end
