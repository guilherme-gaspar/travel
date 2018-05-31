class Driver < ActiveRecord::Base
  belongs_to :admin
  has_many :routes
end
