class Backoffice::UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_notifications, :new_statement

  layout 'user/admin_lte_2'

  def find_notifications
    @notifications = Notification.where(["university_id = ? AND notification_date = ? AND admin_id = ?", current_user.university.id, Date.today, current_user.admin.id])
  end

  def new_statement
    @statement = Statement.new
  end


end
