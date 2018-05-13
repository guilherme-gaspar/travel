class Contract < ActiveRecord::Base

  validates :number_installments, presence: true
  validates :value, presence: true

  belongs_to :user
  belongs_to :admin
  has_many :invoices



end
