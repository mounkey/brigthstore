class CategoriesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :update, :edit, :destroy]
  
  before_action :set_category, only:[:destroy, :show, :update, :edit]
  #skip_before_action :authenticate_user!, only: [:index, :show]
  authorize @categories


  def index
    @categories = Category.all
    #@categories = policy_scope(category).order(created_at: :desc)
  end

  def edit
  end

  def destroy
    record.user = user
    if @category.destroy
      redirect_to category_path
    end
  end

  def new
    @category = Category.new
  end

  def create
    record.user = user
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def update
    record.user = user
    @category = Category.new(category_params)

    if @category.update
      redirect_to @categoty
    else
      render :edit
    end
  end

  def show
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
