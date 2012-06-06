class Location < ActiveRecord::Base

  has_many :bookshelves, :class_name => 'Bookshelf'

  validates_presence_of :name

  mount_uploader :map, MapUploader

end

