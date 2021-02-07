class HistoricSensor < ActiveRecord::Base
  establish_connection :external
  belongs_to :sensor
  validates :sensor, presence: true
  belongs_to :place
  validates :place, presence: true
  belongs_to :item_type
  validates :item_type, presence: true
  belongs_to :situation
  validates :situation, presence: true
end
