# Preview all emails at http://localhost:3000/rails/mailers/route_mailer
class RouteMailerPreview < ActionMailer::Preview
  def send_route_email
    RouteMailer.send_route_email(Route.first, Driver.first)
  end
end
