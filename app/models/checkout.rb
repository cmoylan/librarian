class Checkout < ActiveRecord::Base
  validates :borrower, :presence => true
  validates :due, :presence => true

  belongs_to :book

end

