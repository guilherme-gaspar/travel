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

    car = @route.car
    car.available = 0
    car.save

    driver = @route.driver
    driver.available = 0
    driver.save

    if @route.save
      create_passengers(@route)
      RouteMailer.send_route_email(@route, @route.driver).deliver_now
      redirect_to backoffice_admins_routes_path, notice: "A rota para (#{@route.university.name}) foi cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def create_passengers(route)
    day_of_week = period_week
    period_day = route.period_day
    university = University.find(route.university.id).name
    quantity_passengers = 0
    capacity = route.car.capacity
    qtt_users = User.where("allocated = 0").joins(:university).where(:universities => {:name => university}).joins(:week).where(day_of_week, period_day).count

    if (qtt_users <= capacity)
      quantity_passengers = qtt_users
    else
      quantity_passengers = capacity
    end

    quantity_passengers.times do
      user = User.where("allocated = ?", 0).joins(:university).where(:universities => {:name => university}).joins(:week).where(day_of_week, period_day).first
      statement = Statement.where("user_id = ? and skip_day = ?", user.id, Date.today).first
      unless statement
        passenger = Passenger.create!(
          route: route,
          user: user
        )
        if user
          user.allocated = 1
          user.save
        end
      else
        unless statement.skip_period == period_day
          passenger = Passenger.create!(
            route: route,
            user: user
          )
          if user
            user.allocated = 1
            user.save
          end
        else
          if user
            user.allocated = 1
            user.save
          end
        end
      end
    end
  end

  def period_week
    if(Date.today.wday == 1)
      "mond = ?"
    elsif (Date.today.wday == 2)
      "tues = ?"
    elsif (Date.today.wday == 3)
      "wedn = ?"
    elsif (Date.today.wday == 4)
      "thur = ?"
    elsif (Date.today.wday == 5)
      "frid = ?"
    elsif (Date.today.wday == 6)
      "satu = ?"
    elsif (Date.today.wday == 0)
      0
    end
  end

  def update
    if @route.update(params_route)
      redirect_to backoffice_admins_routes_path, notice: "A rota para (#{@route.university.name}) foi atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy

    @route.users.each do |user|
      user.allocated = 0
      user.save
    end

    car = @route.car
    car.available = 1
    car.save

    driver = @route.driver
    driver.available = 1
    driver.save

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
