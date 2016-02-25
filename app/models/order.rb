class Order < ActiveRecord::Base
  has_many :items, dependent: :destroy
  def calPrice()
    sum = 0
    order = Order.find(self.id)

    order.items.each do |item|
      sum += item.price
    end
    order.update_attributes :total => sum
  end

end
