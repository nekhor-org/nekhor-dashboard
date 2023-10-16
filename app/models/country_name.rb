class CountryName < ApplicationRecord
  belongs_to :language
  belongs_to :country

  validates :name, presence: true
end
