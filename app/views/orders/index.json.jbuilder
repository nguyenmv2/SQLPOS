json.array!(@orders) do |order|
  json.extract! (order, :id, :total)
end
