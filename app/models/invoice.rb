class Invoice < ActiveRecord::Base
  
  enum status: [:pending, :paid]


  belongs_to :contract

end
