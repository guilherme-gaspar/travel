class Backoffice::Admins::DashboardController < Backoffice::AdminsController
  def index
    @drivers_count = Driver.all.count
    @users_count = User.all.count
  end
end
