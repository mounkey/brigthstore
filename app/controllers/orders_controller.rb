class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy, :show, :update, :edit]

  def index
    @orders = Order.all
  end

  # confirmacion
  def show
    @currentUser = current_user.id
    if current_order.order_items.present?
      @orderitems_howmany = ""
    else
      @orderitems_howmany = "No hay Articulos en el carro de compra"
    end
    @order_art = Order.find_by(id: current_order.id, user_id: @currentUser)
    @order_total = @order.order_items.where(order_id: @order).sum(:total_price)
  end

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

  def address
    
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
