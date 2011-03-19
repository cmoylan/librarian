class Location < ActiveRecord::Base
  has_many :bookshelves

  validates_presence_of :name
  validates_presence_of :map

  mount_uploader :map, MapUploader

end
