json.array!(@rentals) do |rental|
  json.extract! rental, :id, :task_id, :store_id, :name, :description, :price, :complete
  json.url rental_url(rental, format: :json)
end
