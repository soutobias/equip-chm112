class Sensor < ActiveRecord::Base
  establish_connection :external
  belongs_to :place
  has_many :historic_sensors
end
