class RecurringGoalsController < ApplicationController

  def show
    RecurringGoal.find(params[:id]).update completed: true
    redirect_to :back
  end

  def create
    current_user.recurring_goals.create(name: params[:recurring_goal][:name], completed: false)
    redirect_to :back
  end

end
