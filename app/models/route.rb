class Route < ActiveRecord::Base
  validates :period_day, presence: true
  belongs_to :driver
  belongs_to :admin
  belongs_to :university
  belongs_to :car
  has_many :passengers, dependent: :destroy # Primeiro o has many do through para depois has_many do join \/
  has_many :users, :through => :passengers

end
