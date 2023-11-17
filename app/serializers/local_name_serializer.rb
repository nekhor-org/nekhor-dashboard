class LocalNameSerializer < ActiveModel::Serializer
  attributes :id, :name, :countries, :local_id
  # has_one :language
  # has_one :local

  def local_id
    object.local_id
  end

  def countries
    object.local.countries.map do |country|
      {
        id: country.id,
        name: country.name,
      }
    end
  end
end
