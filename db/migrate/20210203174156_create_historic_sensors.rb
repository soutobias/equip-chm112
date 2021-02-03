class CreateHistoricSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :historic_sensors do |t|

      t.timestamps
    end
  end
end
