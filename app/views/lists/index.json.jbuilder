json.array!(@lists) do |list|
  json.extract! list, :id, :user_id, :list_type_id, :item_category_id, :unit_id, :store_id, :brand_id, :name, :identifier, :price, :quantity
  json.url list_url(list, format: :json)
end
