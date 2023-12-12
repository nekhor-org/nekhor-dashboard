class LocalNameCustomSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :countries, :local_id
  # has_one :language
  # has_one :local

  def local_id
    object.local_id
  end

  def countries
    object.local.countries.map do |country|
      
      posts = country.posts.limit(4).map do |post|
        post.post_contents.where(language_id: object.language.id).last
      end

      {
        id: country.id,
        name: country.name,
        posts: posts.map do |post| 
          {
            id: post.id,
            post_id: post.post_id,
            image: post.post&.image&.attached? ? rails_blob_path(post.post.image, only_path: true) : nil,
            title: post.title
          }
        end
      }
    end
  end
end
