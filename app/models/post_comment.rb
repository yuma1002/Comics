class PostComment < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    
    has_many :favorites, dependent: :destroy
    def favorited_by?(customer)
        favorites.exists?(customer_id: customer.id)
    end
    
end
