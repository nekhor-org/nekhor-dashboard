class MenuSerializer < ActiveModel::Serializer
  attributes :id, :introduction, :buddha, :guru
  has_one :language
end
