class Backoffice::Admins::ReportsController < Backoffice::AdminsController
  
  def index
    Prawn::Document.generate("hello.pdf") do
      text "Hello World!"
    end
  end


  def pdf
    pdf_filename = File.join(Rails.root, "hello.pdf")
    send_file(pdf_filename, :filename => "your_document.pdf", :type => "application/pdf")
  end


end
