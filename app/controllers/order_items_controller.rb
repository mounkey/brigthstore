class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:destroy, :edit, :update, :suma, :totalprice_wear]
  before_action :authorized_user?, only: [:create, :update, :destroy]
  skip_after_action :verify_authorized

  def new
    @order_item = current_order.order_items.new
    #authorize @order_item
  end

  def create
    @order_item = current_order.order_items.new(order_items_params)
    #authorize @order_item

    if @order_item.save
      wear = @order_item.wear

      redirect_to wear_path(id: @order_item.wear_id), notice: "#{wear.descripcion} ha sido agregado en tu carrito de compra"
    else
      render :new
    end
  end

  def edit
  end

  def update
    #authorize @order_item
    if @order_item.update(order_items_params)
      redirect_to order_path(current_order), notice: "Has actualizado un item de tu carrito de compra"
    else
      render :edit
    end
  end

  def destroy
    #authorize @order_item
    if @order_item.destroy
      redirect_to order_path, alert: "Has eliminado un item desde tu carrito de compra"
    end
  end


  def suma
    case params[:sel]
    when '1'
      @order_item.cantidad += 1
    when '2'
      @order_item.cantidad -= 1
    end
    if @order_item.save!
      totalprice_wear
      redirect_to order_path(current_order), notice: "Bingo! Agregaste un item mas!"
    else
      redirect_to order_path(current_order), alert: "Sorry, my friend, algo paso mal"
    end
  end

  def confirm
    category_shared
    @order = Order.all
    @order_item = OrderItem.all
    @order_total  = @order_item.where(order_id: @order).sum(:total_price)
  end

  
  private

  def set_order_item
    @order_item = current_order.order_items.find(params[:order_id])
  end

  def order_items_params
    params.require(:order_item).permit(:wear_id, :order_id, :price, :cantidad, :total_price)
  end

  def authorized_user?
    if current_user != current_order.user
      redirect_to root_path, alert: "No estas autorizado para esta acción"
    end
  end

  def totalprice_wear
    price = @order_item.price * @order_item.cantidad
    @order_item.total_price = price
    @order_item.save
  end

  def category_shared
    @ids = []
    @pics = []
    Category.all.each do |c|
      @ids << c.id
      @pics << c.imagen
    end
  end
  
end
