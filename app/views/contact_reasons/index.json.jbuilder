json.array!(@contact_reasons) do |contact_reason|
  json.extract! contact_reason, :id, :name
  json.url contact_reason_url(contact_reason, format: :json)
end
