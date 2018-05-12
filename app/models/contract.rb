class Contract < ActiveRecord::Base
  belongs_to :user
  belongs_to :admin
  has_many :invoices



end
