class Backoffice::Admins::DashboardController < Backoffice::AdminsController
  def index
    @drivers_count = Driver.where(available: 1).count
    @users_count = User.all.count
    @cars_count = Car.where(available: 1).count
    @open_invoices = Invoice.where(status: 0).count
  end
end
