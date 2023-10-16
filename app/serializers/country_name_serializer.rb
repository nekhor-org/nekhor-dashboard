class CountryNameSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :language
  has_one :country
end
