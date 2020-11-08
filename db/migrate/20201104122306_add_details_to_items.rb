class AddDetailsToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :seller, null: false
    add_reference :items, :buyer, default: ""
  end
end
