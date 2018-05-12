class AddFantasyNameAndSocialNameAndCnpjAndPhoneAndStreetAndCityAndStateAndNumberToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :fantasy_name, :string
    add_column :admins, :social_name, :string
    add_column :admins, :cnpj, :string
    add_column :admins, :phone, :string
    add_column :admins, :street, :string
    add_column :admins, :city, :string
    add_column :admins, :state, :string
    add_column :admins, :number, :string
  end
end
