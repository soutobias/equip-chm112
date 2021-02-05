class Sensor < ActiveRecord::Base
  establish_connection :external
  belongs_to :place
  validates :place, presence: true

  belongs_to :item
  belongs_to :item_type
  validates :item_type, presence: true

  belongs_to :situation
  validates :situation, presence: true

  has_one_attached :photo
  # validates :photo, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  has_one_attached :file
  # validates :file, attached: true, content_type: ['application/pdf', 'image/png', 'image/jpg', 'image/jpeg']

  has_many :historic_sensors
end
