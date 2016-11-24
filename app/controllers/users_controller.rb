class UsersController < ApplicationController
  before_action :authenticate_user!
  before_filter :validate_user

  def show
    @user = User.find(params[:id])
    @recurring_goal = RecurringGoal.new
    @milestone_track = MilestoneTrack.new
    @milestone = Milestone.new
    @milestones_all = Milestone.all
    @recurring_goals_all = RecurringGoal.all
  end

  private
    def validate_user
      redirect_to(root_url) unless current_user.id.to_s == params[:id]
    end
end
