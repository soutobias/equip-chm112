class AltColumnHistoric < ActiveRecord::Migration[6.0]
  def change
    add_column :historic_sensors, :serial_number, :string
    add_column :historic_sensors, :owner, :string
    add_column :historic_sensors, :manufacturer, :string
    add_column :historic_sensors, :model, :string
    add_column :historic_sensors, :manual, :string
    add_column :historic_sensors, :datasheet, :string
    add_column :historic_sensors, :acquisition_date, :date
    add_column :historic_sensors, :maintenance_date, :date
    add_column :historic_sensors, :calibration_date, :date
    add_column :historic_sensors, :observation, :text
    add_column :historic_sensors, :register_number, :integer
    add_reference :historic_sensors, :sensor, index: true
    add_reference :historic_sensors, :item_type, index: true
    add_reference :historic_sensors, :place, index: true
    add_reference :historic_sensors, :situation, index: true
    add_reference :historic_sensors, :user, index: true
  end
end
