class OrdersController < ApplicationController
  before_action :set_order, only [:destroy, :show, :update, :edit]
  def index
    @order = Order.all
  end

  def show
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end
end
