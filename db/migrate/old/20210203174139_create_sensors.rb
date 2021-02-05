class CreateSensors < ActiveRecord::Migration[6.0]
  def change
    create_table :sensors do |t|

      t.timestamps
    end
  end
end
