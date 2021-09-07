class OrdersController < ApplicationController
 before_action :set_order, only: [:destroy, :show, :update, :edit]
  
  def index
    @orders = Order.all
  end

  # confirmacion
  def show; end

  def new
    @order = current_order
  end

  def create
    @order = current_order
    if @order.update(order_params)
      redirect_to @order
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to @order
    else
      render :edit
    end
  end

  def destroy
    if @order.destroy
      redirect_to order_path
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end 

  def order_params
    params.require(:order).permit(:monto, :fecha, :order_detail, :order_detail_id)
  end
end
