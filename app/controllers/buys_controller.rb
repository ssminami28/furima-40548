class BuysController < ApplicationController
  def index
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(order_params)
    if @buy.valid?
      @buy.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:buy).permit(:price)
  end
end
