class University < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? }

  has_many :notifications
  belongs_to :admin
  has_many :routes

  def address
    [number, street, city, state, "BR"].compact.join(', ')
  end

  def address_view
    [street, number, city, state].compact.join(' - ')
  end

end
