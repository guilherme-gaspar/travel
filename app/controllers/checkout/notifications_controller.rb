class Checkout::NotificationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  def create
    transaction = PagSeguro::Transaction.find_by_notification_code(params[:notificationCode])

    if transaction.errors.empty?
      status_code = transaction.status.id.to_i
      invoice_id = transaction.reference.to_i

      if status_code == 3
        invoice = Invoice.find(invoice_id)
        invoice.paid!
      end
    end

    render nothing: true, status: 200
  end
end
