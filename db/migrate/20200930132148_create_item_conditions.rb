class CreateItemConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :item_conditions do |t|
      t.string :name,     null: false
      t.string :ancesty,  null: false

      t.timestamps
    end
  end
end
