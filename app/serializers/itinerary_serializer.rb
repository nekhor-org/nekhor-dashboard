class ItinerarySerializer < ActiveModel::Serializer
  attributes :id, :post_id, :title

  has_one :post

  def title
    object.post&.title
  end

  def subtitle
    object.post&.subtitle
  end
end
