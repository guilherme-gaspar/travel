class AddAdminToUniversity < ActiveRecord::Migration
  def change
    add_reference :universities, :admin, index: true, foreign_key: true
  end
end
