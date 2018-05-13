class Checkout::PaymentsController < ApplicationController
  def create
    invoice = Invoice.find(params[:invoice_id])
    render text: "Processando..."
  end
end
