json.array!(@contacts) do |contact|
  json.extract! contact, :id, :ContactReason_id, :title, :details
  json.url contact_url(contact, format: :json)
end
