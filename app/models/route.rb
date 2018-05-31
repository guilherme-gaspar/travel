class Route < ActiveRecord::Base
  validates :period_day, presence: true
  belongs_to :driver
  belongs_to :admin
  belongs_to :university
  belongs_to :car
end
