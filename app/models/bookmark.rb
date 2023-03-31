class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  has_one_attached :image
  validates :customer_id, uniqueness: { scope: :item_id }
end
