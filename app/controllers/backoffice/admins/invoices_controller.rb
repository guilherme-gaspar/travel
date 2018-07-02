class Backoffice::Admins::InvoicesController < Backoffice::AdminsController
  before_action :set_invoice, only: [:destroy]

  def destroy
    invoice_value = @invoice.value
    if @invoice.destroy
      redirect_to backoffice_admins_finances_path, notice: "A parcela com valor R$(#{invoice_value}) foi deletada com sucesso!"
    else
      redirect_to backoffice_admins_finances_path, alert: "Algo de erro aconteceu! Por favor, tente novamente!"
    end
  end

  private

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end
end
