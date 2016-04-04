json.item do
  json.id item.id
  json.price item.price

  json.menu_item do
    json.id item.menu_item.id
    json.name item.menu_item.name
    json.price item.menu_item.price
  end
  
  json.customizations do
    json.partial! partial: 'customizations/customization', collection: item.customizations, as: :customization
  end
end
# json.menu_item item.menu_item, :id, :name, :price
# json.partial! 'customizations/customization', collection: item.customizations


# json.partial! partial 'customizations/customization', collection: item.customizations
