class Backoffice::Users::HomeController < Backoffice::UsersController
  def index
    @users = User.all
  end
end
