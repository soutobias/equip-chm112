class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|
      t.references :item_type, null: false, foreign_key: true
      t.string :serial_number
      t.string :owner
      t.integer :register_number
      t.string :model
      t.string :manufacturer
      t.references :place, null: false, foreign_key: true
      t.references :situation, null: false, foreign_key: true
      t.string :manual
      t.string :datasheet
      t.date :acquisition_date
      t.date :maintenance_date
      t.date :calibration_date
      t.text :observation
      t.timestamps
    end
  end
end
