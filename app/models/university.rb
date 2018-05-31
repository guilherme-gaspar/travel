class University < ActiveRecord::Base
  has_many :notifications
  belongs_to :admin
end
