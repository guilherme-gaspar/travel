class Checkout::PaymentsController < ApplicationController
  def create
    # Email: c09640788250725777119@sandbox.pagseguro.com.br
    # Senha: w6082033298M8xj3
    # Cartão de Crédito: 4111111111111111, Bandeira: VISA, Válido até: 12/2030, CVV: 123

    invoice = Invoice.find(params[:invoice_id])


    payment = PagSeguro::PaymentRequest.new
    payment.reference = invoice.id
    payment.notification_url = checkout_notifications_url
    payment.redirect_url = backoffice_users_home_index_url

    payment.items << {
      id: invoice.id,
      description: "Vencimento em #{invoice.due_date.strftime("%d/%m/%Y")}",
      amount: invoice.value
    }

    response = payment.register

    if response.errors.any?
      redirect_to backoffice_users_home_index_path, alert: "Erro ao processar pagamento"
    else
      redirect_to response.url
    end


  end
end
