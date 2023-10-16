class Country < ApplicationRecord
  belongs_to :local

  has_many :country_names
  has_many :posts

  validates :name, presence: true
end
