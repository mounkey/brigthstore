class CategoriesController < ApplicationController
  before_action :set_category, only:[:destroy, :show, :update, :edit]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @categories = Category.all
    skip_policy_scope
  end

  def edit
  end

  def destroy
    if @category.destroy
      redirect_to category_path
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def update
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
