class CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy, :show, :update, :edit]

  def index
    @categories = Category.all
  end

  def show
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end