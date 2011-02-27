class Bookshelf < ActiveRecord::Base
  validates :location, :presence => true

  has_many :books

end

