class Backoffice::Admins::DashboardController < Backoffice::AdminsController
  def index
    @drivers_count = Driver.where("available = ? and admin_id = ?", 1, current_admin.id).count
    @users_count = User.where(admin_id: current_admin.id).count
    @cars_count = Car.where("available = ? and admin_id = ?", 1, current_admin.id).count
    @open_invoices = Invoice.where(status: 0).joins(:contract).where("contracts.admin_id = ?", current_admin.id).count
  end
end
