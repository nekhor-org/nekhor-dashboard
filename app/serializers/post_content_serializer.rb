class PostContentSerializer < ActiveModel::Serializer
  attributes :id, :title, :subtitle, :content
  has_one :post
  has_one :language
end
