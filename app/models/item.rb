class Item < ApplicationRecord
  has_many :item_types
  has_many :sensors, through: :item_types
end
