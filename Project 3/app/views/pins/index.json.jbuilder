json.array!(@pins) do |pin|
  json.extract! pin, :name
  json.url pin_url(pin, format: :json)
end
