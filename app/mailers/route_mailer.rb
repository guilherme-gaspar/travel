class RouteMailer < ApplicationMailer
  def send_route_email(route, driver)
    @route = route
    @driver = driver
    mail(to: @driver.email, subject: "Sua rota está pronta, veja os detalhes neste E-mail!")
  end
end
