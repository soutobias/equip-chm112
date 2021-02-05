class Item < ActiveRecord::Base
  establish_connection :external
  has_many :item_types
  has_many :sensors, through: :item_types
end
