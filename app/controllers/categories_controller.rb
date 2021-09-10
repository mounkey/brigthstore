class CategoriesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :update, :edit, :destroy]
  before_action :set_category, only:[:destroy, :show, :update, :edit]
  
  def index
    @categories = Category.all
  end

  def edit
    authorize @category
  end

  def destroy
    authorize @category

    if @category.destroy
      flash[:notice] = "Categoria ha sido borrada!!"
      redirect_to categories_path(@categories)
    end
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def update
    authorize @category

    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
    end
  end

  def show
    @wears = @category.wears
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:nombre)
  end
end
