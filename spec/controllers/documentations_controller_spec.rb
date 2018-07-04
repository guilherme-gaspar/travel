require 'rails_helper'

RSpec.describe DocumentationsController, type: :controller do
  it "Responde corretamente" do
    get :index
    expect(response).to be_success
  end
  it "Responde corretamente" do
    get :doc_pagseguro
    expect(response).to be_success
  end
  it "Responde corretamente" do
    get :doc_how_to_use
    expect(response).to be_success
  end
  it "Responde corretamente" do
    get :doc_tips
    expect(response).to be_success
  end
  it "Retorna uma resposta 200" do
    get :index
    expect(response). to have_http_status "200"
  end
end
