class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :customer, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
      t.index [:customer_id, :item_id], unique: true
    end
  end
end
