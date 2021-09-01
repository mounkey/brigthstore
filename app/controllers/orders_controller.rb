class OrdersController < ApplicationController
  before_action :set_order, only [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.use_id = user
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def edit
  end

  def update
    @order = Order.new(order_params)
    @order.use_id = user
    if @order.update
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
    params.require(:order).permit(:monto, :date, :metodopago, :address, :city, :state, :country)
  end
end
