class Backoffice::Users::FinancesController < Backoffice::UsersController

  def index
    @invoices = Invoice.where(contract: current_user.contract)
  end

  def contract
    @contract = Contract.find(current_user.contract.id)
    @admin = Admin.find(current_user.admin.id)
    @invoices = Invoice.where(contract: current_user.contract)
  end
end
