class PagesController < ApplicationController
  def home
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @wear = Wear.where(marca: @name)
      redirect_to search_path
    end
  end
end
