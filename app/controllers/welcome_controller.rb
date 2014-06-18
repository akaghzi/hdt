class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    if user_signed_in?
      @totalwishlistitems = ListItem.unbasketed.where(user_id: current_user.id).count
      @totaltaskitems = Task.incomplete.where(user_id: current_user.id).count
      @totalspending = ListItem.completed.where(user_id: current_user.id).sum("price")
    end
    # @totaltaskspending 
  end

  def help
  end

  def aboutus
  end
end