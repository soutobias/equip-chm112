class ItemType < ActiveRecord::Base
  establish_connection :external
  has_many :sensors
  belongs_to :item
end
