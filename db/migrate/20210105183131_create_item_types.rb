class CreateItemTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :item_types do |t|
      t.references :item, null: false, foreign_key: true
      t.string :item_type
      t.timestamps
    end
  end
end
