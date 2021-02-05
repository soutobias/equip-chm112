class CreateItemTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :item_types do |t|

      t.timestamps
    end
  end
end
