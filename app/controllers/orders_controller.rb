class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy, :show, :update, :edit, :address]

  def index
    @orders = Order.all
  end

  # confirmacion
  def show
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

  def destroy
    if @order.destroy
      redirect_to order_path
    end
  end

  def address
    @search = params["address"]
    if @search.present?
      @adress = @search["address"]
      @city =  @search["city"]
      @state = @search["state"]
      @country = @search["contry"]
      @order[:adress] = @adress
      @order[:city] = @city
      @order[:state] = @state
      @order[:country]= @country
      redirect_to search_path
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:monto, :fecha, :order_detail, :order_detail_id)
  end

  def order_prams2
    params.requiere(:order).permit(:address, :city, :state, :country  )
  end

end
