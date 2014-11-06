json.array!(@menus) do |menu|
  json.extract! menu, :title, :description
  json.url menu_url(menu, format: :json)
end
