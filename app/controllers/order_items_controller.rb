class OrderItemsController < ApplicationController
  before_action: set_orderitem, only [:destroy, :show, :update, :edit]

  def index
    @order_items = OrderItem.all
  end

  def show
  end

  private
  
  def set_orderitem
    @order_item = OrderItem.find(params[:id])
  end

end
