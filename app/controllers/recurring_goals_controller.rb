class RecurringGoalsController < ApplicationController
    before_filter :validate_user

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
      if params[:remove].present?
          goal.delete
          redirect_to :back
      else
          if params[:completed].present?
              goal.update completed: true
              #redirect_to :back
          end
          if params[:recurring_goal][:name].present?
              goal.update name: params[:recurring_goal][:name]
          end
          redirect_to :back
      end
  end

  def update_form
      @recurring_goal = RecurringGoal.find(params[:id])
      @user = @recurring_goal.user
      render :layout => false
  end

  private
      def validate_user
          unless params[:user_id].present?
              recurring_goal = RecurringGoal.find(params[:id])
              recurring_goal_owner = recurring_goal.user_id
              render nothing: true unless current_user.id == recurring_goal_owner
          else
              render nothing: true unless current_user.id.to_s == params[:user_id]
          end
      end
end
