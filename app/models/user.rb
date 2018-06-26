class User < ActiveRecord::Base

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? }

  # validates
  validates :name, presence: true
  validates :university, presence: true

  # Scopos
  scope :by_name_search, ->(code) { joins(:contract).where("name = ?", "#{code}") }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :contract, dependent: :destroy
  has_one :week, dependent: :destroy
  belongs_to :admin
  belongs_to :university
  has_many :passengers, dependent: :destroy # Primeiro o has many do through para depois has_many do join \/
  has_many :routes, :through => :passengers


  accepts_nested_attributes_for :contract
  accepts_nested_attributes_for :week


  def address
    [number, street, city, state, "BR"].compact.join(', ')
  end

end
