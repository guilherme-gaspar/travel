class Users::SessionsController < Devise::SessionsController

  protected
    def after_sign_in_path_for(resource)
      backoffice_users_home_index_path
    end
end
