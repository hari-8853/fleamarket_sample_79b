class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :introduction,           null: false
      t.integer :price,               null: false
      t.references :brand,            null: false
      t.references :item_condition,   null: false
      t.references :postege_payer,    null: false
      t.references :preparation_day,  null: false
      t.references :postage_tyep,     null: false
      t.references :category,         null: false
      t.integer :trading_status,       null: false, default: 0

      t.timestamps
    end
  end
end
