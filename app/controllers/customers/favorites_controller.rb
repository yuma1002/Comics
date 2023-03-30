class Customers::FavoritesController < ApplicationController
    def create
        post_comment = PostComment.find(params[:post_comment_id])
        favorite = current_customer.favorites.new(post_comment_id: post_comment.id)
        favorite.save
        redirect_to items_path
    end
    
    def destroy
        post_comment = PostComment.find(params[:post_comment_id])
        favorite = current_customer.favorites.find_by(post_comment_id: post_comment.id)
        favorite.destroy
        redirect_to items_path
    end
end
