class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :item, null: false
      t.references :user, null: false
      t.integer :delete_check,default: 0
      t.string :comment
      t.timestamps
    end
  end
end
