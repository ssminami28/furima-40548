class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    # ↑idない
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city_name, :block_name, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id)
  end
end