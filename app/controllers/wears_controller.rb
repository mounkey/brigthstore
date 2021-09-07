class WearsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :update, :edit, :destroy]
  before_action :set_wear, only: [:destroy, :show, :update, :edit]

  def index
    @wears = Wear.all
    #wears = policy_scope(wear).order(created_at: :desc)
  end

  def show
  end

  def new
    @wear = Wear.new
    authorize @wear
    @categories = Category.all
  end

  def create
    @wear = Wear.new(wear_params)
    authorize @wear
    @wear.user_id = current_user.id
    if @wear.save 
      redirect_to wears_path
    else
      render :new
    end
  end

  def edit
    authorize @wear
    @categories = Category.all
  end

  def update
    authorize @wear
    #@wear.user_id = current_user.id
    if @wear.update(wear_params)
      redirect_to wears_path
    else
      render :edit
    end
  end

  def destroy
    authorize @wear
    if @wear.delete
      redirect_to wears_path
    end
  end

  private

  def set_wear
    @wear = Wear.find(params[:id])
  end 

  def wear_params
    params.require(:wear).permit(:category_id, :talla, :color, :descripcion, :marca, :valor, :user_id, :photo)
  end
end
