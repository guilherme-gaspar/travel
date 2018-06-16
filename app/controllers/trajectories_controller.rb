class TrajectoriesController < ApplicationController
  before_action :set_route, only: [:show]

  def show
    @users = @route.users
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      marker.infowindow "<b>#{user.name}</b>"
    end
  end


  private

    def set_route
      @route = Route.find(params[:id])
    end

end
