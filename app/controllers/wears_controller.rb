class WearsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :update, :edit, :destroy]
  before_action :set_wear, only: [:destroy, :show, :update, :edit]

  def index
    @wears = Wear.all
    #@wears = policy_scope(wear).order(created_at: :desc)
  end

  def show
    authorize @wear
  end

  def new
    @wear = Wear.new
  end

  def create
    @wear = Wear.new(wear_params)
    authorize @wear
    @wear.user_id = current_user
    
    if @wear.save
      redirect_to @wear
    else
      render :new
    end
  end

  def edit
    authorize @wear
  end

  def destroy
    authorize @wear
    if @wear.delete
      redirect_to wear_path
    end
  end

  def update
    @wear = Wear.update(wear_params)
    authorize @wear
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
    params.require(:wear).permit(:category, :talla, :color, :description, :marca, :valor)
  end
end