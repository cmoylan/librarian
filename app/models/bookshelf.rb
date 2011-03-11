class Bookshelf < ActiveRecord::Base
  has_many :books

  validates :location, :presence => true


  def display_name
    "#{location}"
  end

end

