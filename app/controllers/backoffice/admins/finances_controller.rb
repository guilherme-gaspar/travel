class Backoffice::Admins::FinancesController < Backoffice::AdminsController

  def index
    @users = User.where(admin: current_admin)
  end

  def search
    user = User.by_name_search(search_params)
    contract = Contract.where(user_id: user.ids)
    @invoices = Invoice.where(contract_id: contract)
  end



  private

    def search_params
      params.permit(:utf8, :by_name_finances)[:by_name_finances]
    end
end
