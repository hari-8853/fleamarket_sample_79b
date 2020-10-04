class CreatePostageTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :postage_types do |t|

      t.timestamps
    end
  end
end
