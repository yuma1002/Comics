class Customers::CartItemsController < ApplicationController
     before_action :authenticate_customer!

 
    def index
        @cart_items = current_customer.cart_items
        @total_price = @cart_items.sum{|cart_item|cart_item.item.price_without_tax * cart_item.quantity * 1.1}

    end


    def create
        # @cart_item = current_customer.cart_items.build(item_id: params[:item_id])
        @cart_item = CartItem.new()
        @item = Item.find(params[:item_id])
            
        #@cart_item = CartItem.create(customer_id: current_customer.id, item_id: @item.id)
        @cart_item.customer_id = current_customer.id
        @cart_item.item_id = params[:item_id]
        # byebug

        if @cart_item.save
           flash[:notice] = "#{@cart_item.item.name}をお気に入りに追加しました。"
           redirect_to item_path(params[:item_id])
        else
            flash[:alert] = "個数を選択してください"
            redirect_to item_path(params[:item_id])
        end
    end

    # 削除や個数を変更した際、カート商品を再計算する
    def update
        @cart_item = CartItem.find(params[:id])
        #@cart.units += cart_params[:units].to_i
        @cart_item.update(cart_item_params)
        redirect_to customers_cart_items_path
    end

    # カート商品を一つのみ削除
    def destroy
     @cart_item = CartItem.find_by(item_id: params[:id], customer_id: current_customer.id)
        @cart_item.destroy
        flash.now[:alert] = "#{@cart_item.item.name}を削除しました"
        redirect_to item_path(params[:id])
    end


 

end
