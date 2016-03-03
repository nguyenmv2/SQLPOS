class Order < ActiveRecord::Base
  has_many :items, dependent: :destroy

  def calPrice()
    sum = 0
    self.items.each do |item|
      sum += item.price
    end
    self.update_attributes :total => sum
  end

end
