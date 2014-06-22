json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :user_id, :name, :phone, :fax, :email, :description
  json.url vendor_url(vendor, format: :json)
end
