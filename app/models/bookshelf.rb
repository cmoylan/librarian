class Bookshelf < ActiveRecord::Base
  has_many :books
  belongs_to :location

  validates :name, :presence => true


  def available?
    # true if it doesn't belong to a location
    self.location.nil?
  end

end

