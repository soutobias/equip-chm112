class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|
      t.string :status
      t.timestamps
    end
  end
end
