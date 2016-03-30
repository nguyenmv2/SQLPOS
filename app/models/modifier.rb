class Modifier < ActiveRecord::Base
  has_many :customizations, dependent: :destroy

end
