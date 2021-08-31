class OrderitemsController < ApplicationController
  before_action: set_orderitem, only [:destroy, :show, :update, :edit]

  def index
    @orderitem = OrderItem.all
  end

  def show
  end

  private
  
  def set_orderitem
    @orderitem = OrderItem.find(params[:id])
  end

end
