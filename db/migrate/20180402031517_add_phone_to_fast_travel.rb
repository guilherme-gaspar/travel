class AddPhoneToFastTravel < ActiveRecord::Migration
  def change
    add_column :fast_travels, :phone, :string
  end
end
