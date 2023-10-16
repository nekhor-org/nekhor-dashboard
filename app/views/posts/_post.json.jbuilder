json.extract! post, :id, :lat, :lng, :country_id, :local_id, :created_at, :updated_at
json.url post_url(post, format: :json)
