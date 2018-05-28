class Backoffice::Admins::NotificationsController < Backoffice::AdminsController
  before_action :set_notification, only: [:edit, :update, :destroy]

  def index
    @notifications = Notification.all.where(["admin_id = ?", current_admin.id]).page(params[:page]).per(7)
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(params_notification)
    @notification.admin = current_admin
    if @notification.save
      redirect_to backoffice_admins_notifications_path, notice: "A notificação (#{@notification.title}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @notification.update(params_notification)
      redirect_to backoffice_admins_notifications_path, notice: "A notificação (#{@notification.title}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    notification_title = @notification.title
    if @notification.destroy
      redirect_to backoffice_admins_notifications_path, notice: "A notificação (#{@notification.title}) foi deletado com sucesso!"
    else
      render :index
    end
  end

  private

    def set_notification
      @notification = Notification.find(params[:id])
    end

    def params_notification
      params.require(:notification).permit(:id, :title, :description, :notification_date, :university_id, :admin_id)
    end

end
