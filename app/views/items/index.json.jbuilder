json.array!(@items) do |item|
  json.extract! item, :id,  :price, :menu_item_id, :order_id
end
