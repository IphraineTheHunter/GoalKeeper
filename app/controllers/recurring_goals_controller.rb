class RecurringGoalsController < ApplicationController

  def show
    goal = RecurringGoal.find(params[:id])
    if (params[:name])
      goal.update name: params[:name]
    end
    if (params[:completed])
      goal.update completed: params[:completed]
    end
    redirect_to :back
  end

  def create
    current_user.recurring_goals.create(name: params[:recurring_goal][:name], completed: false, goal_type: params[:recurring_goal][:goal_type])
    redirect_to :back
  end

  def recurring_goal_action
      render :layout => false
  end

end
