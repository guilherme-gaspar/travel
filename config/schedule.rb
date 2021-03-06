# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
env :PATH, ENV['PATH']
set :environment, "development"
set :output, 'log/whenever.log'
#
every 1.day, at: '00:00 am' do
  runner "User.where(allocated: 1).update_all(allocated: 0)"
end
every 1.day, at: '00:00 am' do
  runner "Car.where(available: 0).update_all(available: 1)"
end
every 1.day, at: '00:00 am' do
  runner "Driver.where(available: 0).update_all(available: 1)"
end
every 1.day, at: '00:00 am' do
  runner "Route.destroy_all"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
