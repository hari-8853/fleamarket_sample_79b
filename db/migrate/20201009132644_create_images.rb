class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :url,       null:false
      t.references :item,  null: false

      t.timestamps
    end
  end
end
