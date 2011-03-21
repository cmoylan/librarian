class Bookshelf < ActiveRecord::Base
  has_many :books
  has_one :location

  validates :location, :presence => true


  def display_name
    "#{name}"
  end

end

