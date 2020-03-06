json.extract! restaurant, :id, :name, :image_url, :decription, :owner_id, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
