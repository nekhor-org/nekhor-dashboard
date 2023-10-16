class Post < ApplicationRecord
  belongs_to :country
  belongs_to :local

  has_many :post_contents
  has_many :audios
  has_many :images
  has_many :favorites
  has_many :itineraries
end
