class Item < ActiveRecord::Base
  belongs_to :menu_item
  has_many :customizations
end
