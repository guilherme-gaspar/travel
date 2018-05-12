class AddDueDateToFastTravel < ActiveRecord::Migration
  def change
    add_column :fast_travels, :due_date, :date
  end
end
