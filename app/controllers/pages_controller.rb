class PagesController < ApplicationController
  def home
    @categories = Category.All
  end

  def who

  end

  def contact
    
  end

  def help
    
  end
end
