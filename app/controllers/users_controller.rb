class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :validate_user

  def show
    @user = User.find(params[:id])
    @recurring_goal = RecurringGoal.new
    @recurring_goals_all = RecurringGoal.all
  end

  private
    def validate_user
        unless current_user.supporters.find_by(supporter_id: params[:id]).present? or
            current_user.id.to_s == params[:id]
            redirect_to(root_url)
        end
#            redirect_to(root_url) unless current_user.id.to_s == params[:id]
    end
end
