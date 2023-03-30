class Customers::ItemsController < ApplicationController
    
 def top
  @genres = Genre.all
  @items = Item.all
 end

 def index
  @genres = Genre.all
  
  @items = Item.all
  @items_all = Item.all
  
  #検索オブジェクト
  @search = Item.ransack(params[:q])
  #検索結果
  @items = @search.result
 end

 
 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.all
  @post_comment = PostComment.new
 end

 def about
    
 end


  private
  def item_params
    params.require(:item).permit(:image)
  end
end