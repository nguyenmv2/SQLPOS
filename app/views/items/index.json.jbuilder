json.array!(@items) do |item|
  json.extract! item, :id, :name, :price, :menu_item_id
  json.url item_url(item, format: :json)
end
