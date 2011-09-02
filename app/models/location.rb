class Location < ActiveRecord::Base
  has_many :bookshelves

  validates_presence_of :name

  mount_uploader :map, MapUploader

end
