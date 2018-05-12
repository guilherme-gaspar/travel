class Backoffice::Admins::DriversController < Backoffice::AdminsController
  before_action :set_driver, only: [:edit, :update, :destroy]

  def index
    @drivers = Driver.all.page(params[:page]).per(7)
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(params_driver)
    if @driver.save
      redirect_to backoffice_admins_drivers_path, notice: "O motorista (#{@driver.name}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @driver.update(params_driver)
      redirect_to backoffice_admins_drivers_path, notice: "O motorista (#{@driver.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    driver_name = @driver.name
    if @driver.destroy
      redirect_to backoffice_admins_drivers_path, notice: "O motorista (#{driver_name}) foi deletado com sucesso!"
    else
      render :index
    end
  end

  private

    def set_driver
      @driver = Driver.find(params[:id])
    end

    def params_driver
      params.require(:driver).permit(:email, :password, :password_confirmation, :name)
    end
end
