class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :cart_items, dependent: :destroy
         has_many :orders, dependent: :destroy
         has_many :shipping_addresses, dependent: :destroy
         has_many :post_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :items, dependent: :destroy
         has_many :bookmarks, dependent: :destroy
         has_many :bookmark_items, through: :bookmarks, source: :item

 def bookmark(item)
  bookmark_items << item
 end

 def unbookmark(item)
  bookmark_items.destroy(item)
 end

 def bookmark?(item)
  bookmark_items.include?(item)
 end

    # 退会機能
 def active_for_authentication?
      super && (self.is_customer_status == false)
 end

 validates :last_name, presence: true
  
end
