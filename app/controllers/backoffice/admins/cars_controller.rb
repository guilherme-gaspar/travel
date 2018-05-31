class Backoffice::Admins::CarsController < Backoffice::AdminsController
  before_action :set_car, only: [:edit, :update, :destroy]

  def index
    @cars = Car.all.page(params[:page]).per(7)
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params_car)
    @car.admin = current_admin
    if @car.save
      redirect_to backoffice_admins_cars_path, notice: "O carro (#{@car.plate}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car.update(params_car)
      redirect_to backoffice_admins_cars_path, notice: "O carro (#{@car.plate}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    car_name = @car.plate
    if @car.destroy
      redirect_to backoffice_admins_cars_path, notice: "O carro (#{@car.plate}) foi deletado com sucesso!"
    else
      render :index
    end
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end

    def params_car
      params.require(:car).permit(:capacity, :plate, :model, :year, :mark)
    end
end
