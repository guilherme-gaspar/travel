class University < ActiveRecord::Base
  has_many :notifications
  belongs_to :admin
  has_many :routes
end
