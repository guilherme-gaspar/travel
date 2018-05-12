class AddPriceAndInicialTourAndFinalTourToFastTravel < ActiveRecord::Migration
  def change
    add_column :fast_travels, :price, :double
    add_column :fast_travels, :inicial_tour, :string
    add_column :fast_travels, :final_tour, :string
  end
end
