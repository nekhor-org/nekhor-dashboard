class CountrySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :local
end
