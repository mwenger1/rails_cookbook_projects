json.array!(@site_details) do |site_detail|
  json.extract! site_detail, :title, :organization, :address, :facebook, :twitter, :google_plus, :skype, :linkedin, :google_analytics, :telephone
  json.url site_detail_url(site_detail, format: :json)
end
