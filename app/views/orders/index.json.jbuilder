
json.orders do
  json.partial! partial:'orders/showTree', collection: @orders, as: :order
end
# json.orders @orders, partial: 'orders/order', as: :order
