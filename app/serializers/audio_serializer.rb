class AudioSerializer < ActiveModel::Serializer
  attributes :id, :link
  has_one :post
end
