class RecurringGoalsController < ApplicationController

  def show
    goal = RecurringGoal.find(params[:id])
    if (params[:completed])
      goal.update completed: params[:completed]
    end
    redirect_to :back
  end

  def create
#      byebug
    current_user.recurring_goals.create(name: params[:recurring_goal][:name], completed: false, goal_type: params[:recurring_goal][:goal_type])
    redirect_to :back
  end

  def update
      goal = RecurringGoal.find(params[:id])
      if params[:completed].present?
          goal.update completed: true
          #redirect_to :back
      end
      if params[:recurring_goal][:name].present?
          goal.update name: params[:recurring_goal][:name]
      end
      redirect_to :back
  end

  def update_form
      @recurring_goal = RecurringGoal.find(params[:id])
      @user = @recurring_goal.user
      render :layout => false
  end

end
