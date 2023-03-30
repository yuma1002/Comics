class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  has_one_attached :image
   has_many :post_comments, dependent: :destroy

  #attachment :image
  validates :name, {presence: true}
  validates :description, {presence: true}
  
def self.ransackable_attributes(auth_object = nil)
    ["name"]
end

end
