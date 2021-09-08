class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:destroy, :edit, :update]
  authorize @order_items


  def new
    @order_item = current_order.order_items.new
  end

  def create
    record.user = user
    @order_item = current_order.order_items.new(order_items_params)

    if @order_item.save
      wear = @order_item.wear

      redirect_to wear_path(id: @order_item.wear_id), notice: "#{wear.description} ha sido agregado en tu carrito de compra"
    else
      render :new
    end
  end

  def edit
  end

  def update
    record.user = user
    if @order_item.update(order_items_params)
      redirect_to order_path(current_order), notice: "Has actualizado un item de tu carrito de compra"
    else
      render :edit
    end
  end

  def destroy
    record.user = user
    if @order_item.destroy
      redirect_to root_path, alert: "Has eliminado un item desde tu carrito de compra"
    end
  end

  private

  def set_order_item
    @order_item = current_order.order_items.find(params[:id])
  end

  def order_items_params
    params.require(:order_items).permit(:wear_id, :order_id, :price, :cantidad, :total_price)
  end

end
