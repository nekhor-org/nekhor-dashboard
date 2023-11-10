class PostContentSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :title, :subtitle, :content, :image, :images, :audio, :lng, :lat, :post_id, :country, :local
  has_one :post
  has_one :language

  def post_id
    object.post_id
  end

  def country
    object.post&.country.name
  end

  def local
    object.post&.local.name
  end

  def lng
    object.post&.lng
  end

  def lat
    object.post&.lat
  end

  def image
    rails_blob_path(object.post.image, only_path: true) if object.post&.image&.attached?
  end

  def audio
    rails_blob_path(object.post.audios.last.file, only_path: true) if object.post&.audios&.last&.file&.attached?
  end

  def images
    object.post.images.map do |image|
      rails_blob_path(image.file, only_path: true) if image.file.attached?
    end
  end
end
