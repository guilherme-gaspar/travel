class Backoffice::Admins::RoutesController < Backoffice::AdminsController
  def index
    @weeks = Week.all
    @users = User.all
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|

      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow "<b>#{user.name}</b>"

    end
    @array = ["montreal, quebec", "toronto, ont"]
    @ulbra = "ulbra torres"
    @capao = "capao da canoa, rio grande do sul"
  end

end
