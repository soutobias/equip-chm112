class ItemType < ApplicationRecord
  has_many :sensors
  belongs_to :item
end
