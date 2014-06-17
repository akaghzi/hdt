json.array!(@favorite_items) do |favorite_item|
  json.extract! favorite_item, :id, :user_id, :item_category_id, :unit_id, :store_id, :brand_id, :name, :identifier, :price, :quantity, :imported_at
  json.url favorite_item_url(favorite_item, format: :json)
end
