class Language < ApplicationRecord
  validates :name, presence: true

  has_many :country_names
  has_many :local_names
  has_many :labels
  has_many :menus
  has_many :post_contents
end
