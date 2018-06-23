class Backoffice::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_filter :find_statements

  layout 'admin/admin_lte_2'

  def find_statements
    @statements = Statement.where("admin_id = ? AND skip_day = ?", current_admin, Date.today)
  end
end
