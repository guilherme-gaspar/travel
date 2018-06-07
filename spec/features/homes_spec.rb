require 'rails_helper'

RSpec.feature "Homes", :type => :feature do

  scenario 'Tenha um botão de documentação' do
    visit('/')
    expect(page).to have_content('Documentação')
  end

  scenario 'Tenha um botão login passageiros' do
    visit('/')
    expect(page).to have_content('Passageiros')
  end

  scenario 'Tenha um botão login gestor da empresa' do
    visit('/')
    expect(page).to have_content('Gestor da empresa')
  end

  scenario 'Tenha um titulo da aplicação' do
    visit('/')
    expect(page).to have_content('Travel Manager')
  end


end
