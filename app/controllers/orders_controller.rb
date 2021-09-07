class OrdersController < ApplicationController
 before_action :set_order, only: [:destroy, :show, :update, :edit]
  
  def index
    @orders = Order.all
  end

  def edit
  end

  def destroy
    if @order.destroy
      redirect_to order_path
    end
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def update
    @order = Order.new(order_params)
    @order.user_id = current_user
    if @order.update
      redirect_to @order
    else
      render :edit
    end
  end

  def show

  end
  
  private

  def set_order
    @order = Order.find(params[:id])
  end 

  def order_params
    params.require(:order).permit(:monto, :fecha, :metodoago, :address, :city, :state, :country)
  end
end
