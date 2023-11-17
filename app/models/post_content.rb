class PostContent < ApplicationRecord
  belongs_to :post
  belongs_to :language

  validates :title, :content, presence: true
end
