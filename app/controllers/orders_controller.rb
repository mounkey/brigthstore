class OrdersController < ApplicationController
 before_action :set_order, only: [:destroy, :show, :update, :edit]
  
  def index
    @orders = Order.all
  end

  def edit
  end

  def destroy
    @order.destroy
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def update
    @order = Order.new(order_params)
    @order.update
  end

  def show

  end
  
  private

  def set_order
    @order = Order.find(params[:id])
  end 

  def order_params
    params.require(:order).permit(:monto, :fecha, :metodoago, :address, :city, :state, :country, :use_id)
  end
end
