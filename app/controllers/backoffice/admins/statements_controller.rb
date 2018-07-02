class Backoffice::Admins::StatementsController < Backoffice::AdminsController
  before_action :set_statement, only: [:destroy]


  def destroy
    statement_user = @statement.user.name
    if @statement.destroy
      redirect_to backoffice_admins_dashboard_index_path, notice: "O comunicado de (#{statement_user}) foi deletado com sucesso!"
    else
      redirect_to backoffice_admins_dashboard_index_path, alert: "Algo de erro aconteceu! Por favor, tente novamente!"
    end
  end

  private
    def set_statement
      @statement = Statement.find(params[:id])
    end
end
