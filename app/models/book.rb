class Book < ActiveRecord::Base

  belongs_to :bookshelf

  validates :title, :presence => true
  validates :author, :presence => true

end

