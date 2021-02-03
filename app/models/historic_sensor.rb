class HistoricSensor < ActiveRecord::Base
  establish_connection :external
  belongs to :sensor
end
