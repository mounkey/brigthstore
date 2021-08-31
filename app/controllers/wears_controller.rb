class WearsController < ApplicationController
  before_action :set_wear, only: [:destroy, :show, :update, :edit]

  def index
    @wears = Wear.all
  end

  def show
    
  end

  def new
    @wear = Wear.new()
  end

  def create
    @wear = Wear.new(wear_params)
    @wear.save
  end


  def edit

  end

  def destroy
    @wear.delete
  end

  def update
    
  end

private
  def set_wear
    @wear = Wear.find(params[:id])
  end 

  def wear_params
    params.require(:wear).permit(:category_id, :talla, :color, :description, :user_id, :marca, :valor)
  end
end