class RecurringGoalsController < ApplicationController
  def create
    current_user.recurring_goals.create(name: params[:recurring_goal][:name], completed: false)
    redirect_to :back
  end
end
