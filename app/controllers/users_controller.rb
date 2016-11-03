class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :validate_user

  def show
    @user = current_user
    @recurring_goal = RecurringGoal.new
  end

  private
    def validate_user
      redirect_to(root_url) unless current_user.id.to_s == params[:id]
    end
end
