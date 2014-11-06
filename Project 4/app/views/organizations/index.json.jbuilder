json.array!(@organizations) do |organization|
  json.extract! organization, :name, :description, :owner_id
  json.url organization_url(organization, format: :json)
end
