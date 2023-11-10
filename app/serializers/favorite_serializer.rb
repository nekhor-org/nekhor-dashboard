class FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :post_id

  has_one :post
end
