class Local < ApplicationRecord
  has_many :local_names
  has_many :posts

  validates :name, presence: true
end
