json.array!(@task_vendors) do |task_vendor|
  json.extract! task_vendor, :id, :task_id, :vendor_id, :price
  json.url task_vendor_url(task_vendor, format: :json)
end
