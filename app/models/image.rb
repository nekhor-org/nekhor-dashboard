class Image < ApplicationRecord
  belongs_to :post

  ## ACTIVE STORAGE
  has_one_attached :file
end
