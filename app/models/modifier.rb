class Modifier < ActiveRecord::Base
  has_many :customizations, dependent: :destroy
  accepts_nested_attributes_for :customizations, :reject_if => lambda{ |c| c[:item_id].nil? or c[:modifier_id].nil?}, :allow_destroy => true

end
