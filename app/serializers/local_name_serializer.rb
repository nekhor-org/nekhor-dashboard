class LocalNameSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :language
  has_one :local
end
