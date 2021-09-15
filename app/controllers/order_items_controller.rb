class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:destroy, :edit, :update, :suma, :resta]
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
    ord = OrderItem.find_by(@order)
    cant = ord.cantidad.to_i + 1
    OrderItem.update_attribute(cantidad: cant)
    redirect_to order_path
  end

  def resta
    order = @order.find_by(set_order)
    cant = order.cantidad.to_i - 1
    order.update_attribute :cantidad, cant
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

end
