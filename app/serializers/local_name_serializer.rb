class LocalNameSerializer < ActiveModel::Serializer
  attributes :id, :name, :countries
  # has_one :language
  # has_one :local

  def countries
    object.local.countries.map do |country|
      {
        id: country.id,
        name: country.name,
      }
    end
  end
end
