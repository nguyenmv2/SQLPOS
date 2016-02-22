class Order < ActiveRecord::Base
  has_many :items

  def calPrice(id)
    sum = 0
    items = Item.find_by_order_id(id)

    Item.all.each { |i|
      if (i.id == id)
        sum += i.getPrice
      end
    }
    return sum
  end

end
