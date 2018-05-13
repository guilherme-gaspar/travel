class Backoffice::Users::FinancesController < Backoffice::UsersController
  def index
    @invoices = Invoice.where(contract: current_user.contract)
  end
end
