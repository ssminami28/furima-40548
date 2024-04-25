class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at_DESC')
  end

  def new
    @item = Item.new
  end
end

def create
  @item = Item.new(item_params)
  if @item.save
    redirect_to root_path
  else
    render :new, status: :unprocessable_entity
  end
end

private

def item_params
  params.require(:item).permit(:title, :description, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :image, :price).merge(user_id: current_user.id)
end