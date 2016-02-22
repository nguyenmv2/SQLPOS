class Item < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :order
  has_many :customizations

  def getPrice
    price = self.price
    # mods = Customization.find_by_item_id(self.id)
        Customization.all.each { |c|
          if c.item_id = self.id
            modifier = Modifier.find(c.modifier_id)
            price += modifier.deltaPrice
          end
        }

    return price
  end
end
