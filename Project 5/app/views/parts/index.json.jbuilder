json.array!(@parts) do |part|
  json.extract! part, :title, :part_type_id, :content, :meta, :user_id
  json.url part_url(part, format: :json)
end
