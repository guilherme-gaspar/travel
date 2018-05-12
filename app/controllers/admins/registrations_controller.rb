class Admins::RegistrationsController < Devise::RegistrationsController

  protected
    def after_sign_up_path_for(resource)
      flash[:notice] = "Bem vindo! Você realizou seu registro com sucesso. Para começar a utilizar nosso sistema, preencha os dados da sua empresa abaixo!"
      edit_backoffice_admins_profile_path(resource)

    end
end
