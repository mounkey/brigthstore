class PagesController < ApplicationController

  def home
    @ids = []
    @pics = []
    Category.all.each do |c|
      @ids << c.id
      @pics << c.imagen
    end
  end
end
