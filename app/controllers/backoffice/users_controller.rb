class Backoffice::UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_notifications, :new_statement, :statement_exists

  layout 'user/admin_lte_2'

  def find_notifications
    @notifications = Notification.where(["university_id = ? AND notification_date = ? AND admin_id = ?", current_user.university.id, Date.today, current_user.admin.id])
  end

  def new_statement
    @statement = Statement.new
  end

  def statement_exists
    statement_exists = Statement.where(["user_id = ? and skip_day = ?", current_user.id, Date.today])
    if statement_exists.count == 0
      @statement_exists = false
    else
      @statement_exists = true
    end
  end


end
