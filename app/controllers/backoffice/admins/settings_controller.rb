class Backoffice::Admins::SettingsController < Backoffice::AdminsController
  before_action :set_setting, only: [:edit, :update]
  def edit
    @setting = Setting.find_or_create_by(admin: current_admin)
  end

  def update
    if @setting.update(params_setting)
      redirect_to backoffice_admins_dashboard_index_path, notice: "Configurações atualizadas com sucesso!"
    else
      render :edit
    end
  end

  private
    def set_setting
      @setting = Setting.find_or_create_by(admin: current_admin)
    end
    def params_setting
      params.require(:setting).permit(:id, :token, :days_for_payment)
    end

end
