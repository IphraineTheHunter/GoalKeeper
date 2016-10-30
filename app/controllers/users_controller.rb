class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @recurring_goal = RecurringGoal.new
  end
end
