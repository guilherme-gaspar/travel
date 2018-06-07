class Backoffice::Admins::FastTravelsController < Backoffice::AdminsController
  before_action :set_fast_travel, only: [:edit, :update, :destroy, :show]

  def index
    @fast_travels = FastTravel.all.where(["admin_id = ?", current_admin.id]).page(params[:page]).per(7)
  end

  def new
    @fast_travel = FastTravel.new
  end

  def show
    @fast_travel
  end

  def create
    @fast_travel = FastTravel.new(params_fast_travel)
    @fast_travel.admin = current_admin
    if @fast_travel.save
      redirect_to backoffice_admins_fast_travels_path, notice: "A viagem rápida (#{@fast_travel.number_passenger}) foi cadastrada com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @fast_travel.update(params_fast_travel)
      redirect_to backoffice_admins_fast_travels_path, notice: "A viagem rápida (#{@fast_travel.number_passenger}) foi atualizada com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    fast_travel_name = @fast_travel.name
    if @fast_travel.destroy
      redirect_to backoffice_admins_fast_travels_path, notice: "A viagem rápida (#{fast_travel_name}) foi deletada com sucesso!"
    else
      render :index
    end
  end

  private

    def set_fast_travel
      @fast_travel = FastTravel.find(params[:id])
    end

    def params_fast_travel
        params.require(:fast_travel).permit(:number_passenger, :name, :email, :price, :inicial_tour, :final_tour, :phone, :due_date)
    end


end
