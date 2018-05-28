class Notification < ActiveRecord::Base
  belongs_to :admin
  belongs_to :university
end
