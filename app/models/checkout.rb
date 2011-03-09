class Checkout < ActiveRecord::Base
  belongs_to :book

  validates :borrower, :presence => true
  validates :due, :presence => true

end

