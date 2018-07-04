class Backoffice::Users::HomeController < Backoffice::UsersController
  def index
    @users = User.all
    @invoices = Invoice.where(contract: current_user.contract)
  end
end
