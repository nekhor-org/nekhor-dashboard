class ImageSerializer < ActiveModel::Serializer
  attributes :id
  has_one :post
end
