
# json.partial! 'items/item', collection: @order.items
# json.items @order.items do |json, item|
#   json.partial 'items/item/', item: item
# end
json.order do
  json.id @order.id
  json.table @order.table
  json.total @order.total
  json.items do
    json.partial! partial: 'items/item', collection: @order.items, as: :item
  end
end
