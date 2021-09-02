class WearsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :update, :edit, :destroy]

  before_action :set_wear, only: [:destroy, :show, :update, :edit]
  authorize @category
  
  def index
    #@wears = Wear.all
    @wears = policy_scope(wear).order(created_at: :desc)
  end

  def show
    
  end

  def new
    @wear = Wear.new
  end

  def create
    @wear = Wear.new(wear_params)
    @wear.user_id = current_user
    if @wear.save
      redirect_to @wear
    else
      render :new
    end
  end


  def edit

  end

  def destroy
    if @wear.delete
      redirect_to wear_path
    end
  end

  def update
    @wear= Wear.update(wear_params)
    @wear.user_id = current_user
    if @wear.update
      redirect_to @wear
    else
      render :edit
    end
  end

private
  def set_wear
    @wear = Wear.find(params[:id])
  end 

  def wear_params
    params.require(:wear).permit(:category_id, :talla, :color, :description, :marca, :valor)
  end
end