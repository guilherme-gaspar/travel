class Backoffice::AdminsController < ApplicationController
  before_action :authenticate_admin!

  layout 'admin/admin_lte_2'
end
