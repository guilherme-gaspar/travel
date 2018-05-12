class Backoffice::Admins::ProfileController < Backoffice::AdminsController
  before_action :set_profile, only: [:edit, :update]
  def edit
    @admin = Admin.find_or_create_by(id: current_admin.id)
  end

  def update
    if @admin.update(params_profile)
      redirect_to backoffice_admins_dashboard_index_path, notice: "Perfil atualizado com sucesso!"
    else
      render :edit
    end
  end

  private
    def set_profile
      @admin = Admin.find_or_create_by(id: current_admin.id)
    end
    def params_profile
      params.require(:admin).permit(:id, :email, :fantasy_name, :social_name, :cnpj, :phone, :street, :number, :city, :state, :avatar)
    end

end
