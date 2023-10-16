class PostSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lng
  has_one :country
  has_one :local
end
