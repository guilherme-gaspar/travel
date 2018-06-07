require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario 'Visit index page' do
    visit (backoffice_admins_users_path)
    expect(page).to have_current_path(new_admin_session_path)
  end
end
