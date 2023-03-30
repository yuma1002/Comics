class AddItemIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :item_id, :integer
  end
end
