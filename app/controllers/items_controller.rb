class ItemsController < ApplicationController
  def destroy
    return unless user_signed_in? && current_user.id == @item.user_id

    @item.destroy
    redirect_to root_path
  end
end
