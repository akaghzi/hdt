json.array!(@list_types) do |list_type|
  json.extract! list_type, :id, :name, :description
  json.url list_type_url(list_type, format: :json)
end
