class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :introduction,           null: false
      t.integer :price,               null: false
      t.integer :brand_id
      t.integer :item_condition_id,   null: false
      t.integer :postege_payer_id,    null: false
      t.integer :preparation_day_id,  null: false
      t.integer :postage_tyep_id,     null: false
      t.integer :category_id,         null: false
      t.integer :trading_status,      null: false, default: 0

      t.timestamps
    end
  end
end