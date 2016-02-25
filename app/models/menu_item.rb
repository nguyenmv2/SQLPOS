class MenuItem < ActiveRecord::Base
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, :reject_if => lambda { |a| a[:menu_item_id].nil? }, :allow_destroy => true

end
