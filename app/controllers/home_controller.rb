class HomeController < ApplicationController
  def index
    @user = current_user
    @recurring_goal = RecurringGoal.new
  end
end
