class Backoffice::UsersController < ApplicationController
  before_action :authenticate_user!

  layout 'user/admin_lte_2'
end
