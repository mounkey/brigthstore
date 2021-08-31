class OrderItemsController < ApplicationController
  before_action: only: [:destroy, :edit, :update, :show]
  
  def index
    @order_items = Order_Items.all
  end


  def new
    @order_item = Order_Items.new
  end

  def create
    @order_item = Order_Items.new(order_items_params)
    @order_item.save
  end

  def show
  end

  def edit
  end

  def update
    @order_item = Order_Items.new(order_items_params)
    @order.update
  end

  def destroy
    @order_item.destroy
  end

  private

  def set_orderitems
    @order_items = Order_Items.find(params[:id])
  end

  def order_items_params
    params.require(:order_items).permit(:wear_id, :order_id, :price, :cantidad)
  end

end
