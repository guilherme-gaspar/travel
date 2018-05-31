class Backoffice::Admins::RoutesController < Backoffice::AdminsController
  before_action :set_route, only: [:edit, :update, :destroy]

  # def index
  #   @weeks = Week.all
  #   @users = User.all
  #   @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  #
  #     marker.lat user.latitude
  #     marker.lng user.longitude
  #     marker.infowindow "<b>#{user.name}</b>"
  #
  #   end
  #   @array = ["montreal, quebec", "toronto, ont"]
  #   @ulbra = "ulbra torres"
  #   @capao = "capao da canoa, rio grande do sul"
  # end



  def index
    @routes = Route.all.where(["admin_id = ?", current_admin.id]).page(params[:page]).per(7)
    @capacity = Route.where(period_day: "M").joins(:car).sum(:capacity)
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(params_route)
    @route.admin = current_admin
    if @route.save
      redirect_to backoffice_admins_routes_path, notice: "A rota para (#{@route.university.name}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @route.update(params_route)
      redirect_to backoffice_admins_routes_path, notice: "A rota para (#{@route.university.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    route_name = @route.university.name
    if @route.destroy
      redirect_to backoffice_admins_routes_path, notice: "A rota para (#{@route.university.name}) foi deletado com sucesso!"
    else
      render :index
    end
  end

  private

    def set_route
      @route = Route.find(params[:id])
    end

    def params_route
      params.require(:route).permit(:university_id, :driver_id, :period_day, :origin, :car_id )
    end

end
