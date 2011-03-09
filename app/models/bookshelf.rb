class Bookshelf < ActiveRecord::Base
  has_many :books

  validates :location, :presence => true

end

