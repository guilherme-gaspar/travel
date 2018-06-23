class Backoffice::Users::StatementsController < Backoffice::UsersController

  def create
    @statement = Statement.new(params_statement)
    @statement.admin_id = current_user.admin_id
    @statement.user_id = current_user.id
    if @statement.save
      redirect_to backoffice_users_home_index_path, notice: "O comunicado foi enviado com sucesso!"
    else
      render :new
    end
  end

  private
    def params_statement
      params.require(:statement).permit(:skip_day, :skip_period, :description)
    end
end
