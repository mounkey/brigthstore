class PagesController < ApplicationController
  def home
    if (user_signed_in?)
      @currentUser = current_user.id
    end
  end

  def who

  end

  def contact
    
  end

  def help
    
  end
end
