class Backoffice::Admins::UsersController < Backoffice::AdminsController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.where(["admin_id = ?", current_admin.id]).page(params[:page]).per(7)
  end

  def new
    @user = User.new
    @user.build_contract
    @user.build_week
  end

  def create
    @user = User.new(params_user)
    @user.contract.admin = current_admin
    @user.admin = current_admin

    if @user.save
      create_invoice(@user)
      redirect_to backoffice_admins_users_path, notice: "O usuário (#{@user.name}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def create_invoice(user)
    number_installments_invoice = user.contract.number_installments
    due_date_invoice = user.contract.due_date
    contract_invoice = user.contract
    contract_value = user.contract.value
    count = 1

    number_installments_invoice.times do
      payment_day = (Date.today + count.month)
      invoice = Invoice.create!(
        contract: contract_invoice,
        due_date: payment_day.change(day: due_date_invoice),
        status: 0,
        value: contract_value/number_installments_invoice
      )
      count = count+1
    end
  end

  def update
    if @user.update(params_user)
      redirect_to backoffice_admins_users_path, notice: "O usuário (#{@user.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    user_name = @user.name
    if @user.destroy
      redirect_to backoffice_admins_users_path, notice: "O usuário (#{user_name}) foi deletado com sucesso!"
    else
      render :index
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def params_user
      if password_blank?
        params[:user].except!(:password, :password_confirmation)
      end

      if @user.blank? # Aqui ele estará sendo criado, pois está em branco
        params.require(:user).permit(:id, :email, :password, :password_confirmation, :name,
                                     :street, :city, :number, :state, :phone, :university_id, contract_attributes: [:due_date, :number_installments, :value], week_attributes: [:mond, :tues, :wedn, :thur, :frid, :satu, :user_id] )
      else # Aqui ele estará sendo atualizado, se não estiver em branco...
        params.require(:user).permit(:id, :email, :password, :password_confirmation, :name,
                                     :street, :city, :number, :state, :phone, :university_id, contract_attributes: [:due_date, :number_installments, :value, :id], week_attributes: [:id, :mond, :tues, :wedn, :thur, :frid, :satu, :user_id] )
      end




    end

    def password_blank?
      params[:user][:password].blank? &&
      params[:user][:password_confirmation].blank?
    end

end
