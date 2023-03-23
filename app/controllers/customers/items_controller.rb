class Customers::ItemsController < ApplicationController
    
 def top
  @genres = Genre.all
  @items = Item.all
 end

 def index
  @genres = Genre.all
  
  @items = Item.page(params[:page]).per(8)
  @items_all = Item.all
 end

 
 def show
  @item = Item.find(params[:id])
  @cart_item = CartItem.new
  @genres = Genre.all
 end

 def about
    
 end

end

  private
  def item_params
    params.require(:item).permit(:image,)
  end