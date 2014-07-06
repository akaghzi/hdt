class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    if user_signed_in?
      @totalwishlistitems = ListItem.unbasketed.where(user_id: current_user.id).count
      @totalbasketedlistitems = ListItem.basketed.where(user_id: current_user.id).count
      @totalcompletedlistitems = ListItem.completed.where(user_id: current_user.id).count
      @totalincompletetaskitems = Task.incomplete.where(user_id: current_user.id).count
      @totalcompletedtaskitems = Task.completed.where(user_id: current_user.id).count
      @totalspendingpurchases = ListItem.completed.where(user_id: current_user.id).sum("price")
      @totalspendinglabor = Rental.completed.where("rentals.updated_at >= ?", Date.today-30.day).joins(:task).where("tasks.user_id = ?", current_user.id).sum("price")
      @totalspendingrental = TaskContractor.completed.where("task_contractors.updated_at >= ?", Date.today-30.day).joins(:task).where("tasks.user_id = ?", current_user.id).sum("price")
    end
    # @totaltaskspending 
  end

  def help
  end

  def aboutus
  end
end