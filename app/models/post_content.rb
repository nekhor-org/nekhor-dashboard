class PostContent < ApplicationRecord
  belongs_to :post
  belongs_to :language

  validates :title, :subtitle, :content, presence: true
end
