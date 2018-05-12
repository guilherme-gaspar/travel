class User < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? }

  # Scopos
  scope :by_name_search, ->(code) { joins(:contract).where("name = ?", "#{code}") }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contract
  belongs_to :admin
  belongs_to :university

  accepts_nested_attributes_for :contract


  def address
    [number, street, city, state, "BR"].compact.join(', ')
  end

end
