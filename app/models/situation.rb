class Situation < ActiveRecord::Base
  establish_connection :external
  has_many :sensors
end
