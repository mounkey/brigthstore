class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy, :show, :update, :edit]
  
  def index
    @categories = Category.all
  end

  def edit

  end

  def destroy
    @category.destroy
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end

  def update
    @category = Category.new(category_params)
    @category.update
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
