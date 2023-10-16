json.extract! post_content, :id, :title, :subtitle, :content, :post_id, :language_id, :created_at, :updated_at
json.url post_content_url(post_content, format: :json)
