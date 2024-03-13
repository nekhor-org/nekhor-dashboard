class CountryNameSerializer < ActiveModel::Serializer
  attributes :id, :name, :local_id
  has_one :language
  has_one :country

  def local_id
    object&.country&.local_id
  end
end
