class OrderDetailsController < ApplicationController
  before_action :authorized_user?, only: [:create, :update, :destroy]
  before_action :set_order_details, only: [:destroy, :create]

  
  def new
    Authorize @order_details
    @order_details = OrderDetails.new
  end

  def create
    @order_details = order_details.new(order_details_params)
    authorize @order_details

    if @order_item.save
      order = @order_details.order

      redirect_to order_confirm_path(id: @order)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def set_order_details
    @order_details = current_order.order_items.find(params[:order_id])
  end

  def set_param
    params.require(:order_details).permit(:address, :city, :state, :country, :order_id)
  end

end
