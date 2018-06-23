class AddAdminToStatement < ActiveRecord::Migration
  def change
    add_reference :statements, :admin, index: true, foreign_key: true
  end
end
