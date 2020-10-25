class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                 null: false
      t.text :introduction,           null: false
      t.integer :price,               null: false
      t.references :brand,            foreign_key: true
      t.references :item_condition,   null: false
      t.references :postege_payer,    null: false
      t.references :preparation_day,  null: false
      t.references :postage_tyep,     null: false
      t.references :category,         null: false
      #enum用のinteger型 enumは列挙型
      t.integer :trading_status,       null: false, default: 0
      # 以下はusersテーブルがない為コメントアウト
      # テーブルが実装され次第migrate:resetをしコメントアウトを外す
      #t.references :seller,           null: false, foreign_key: { to_table: :users}
      #t.references :buyer,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
