class Customers::BookmarksController < ApplicationController
     before_action :authenticate_customer!
    
  def index
    @bookmarks = current_customer.bookmarks
    customer = current_customer
    @customer_bookmarks = customer.bookmarks
    #@item = Item.find(params[:id])
    #@items = Item.all
    
  end
    
  def create
      @bookmark = Bookmark.new()
      @bookmark.customer_id = current_customer.id
      @bookmark.item_id = params[:item_id]
    @item = Item.find(params[:item_id])
    
     if @bookmark.save
           flash[:notice] = "#{@bookmark.item.name}をお気に入りに追加しました。"
           redirect_to item_path(params[:item_id])
     else
      
            redirect_to item_path(params[:item_id])
     end
    #current_customer.bookmark(item)
    #redirect_back fallback_location: root_path, success: t('defaults.message.bookmark')
  end

  def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
    #@item = current_customer.bookmarks.find(params[:id]).item
    #current_customer.unbookmark(item)
    #redirect_back fallback_location: root_path, success: t('defaults.message.unbookmark')
  end
  
  private
  def bookmark_params
    params.require(:bookmark).permit(:item_id, :image)
  end
  
  def item_params
    params.require(:item).permit(:image)
  end
 
end
