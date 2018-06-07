class AddStreetNumberStateLatitudeLongitudeToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :street, :string
    add_column :universities, :number, :string
    add_column :universities, :state, :string
    add_column :universities, :latitude, :float
    add_column :universities, :longitude, :float
  end
end
