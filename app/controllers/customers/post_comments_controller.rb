class Customers::PostCommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.item_id = @item.id
    comment.save
    redirect_to items_path
  end

 def destroy
    PostComment.find(params[:id]).destroy
    redirect_to items_path
 end
  
  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
