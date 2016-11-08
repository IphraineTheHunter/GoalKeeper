class HomeController < ApplicationController
  def index
      @user = current_user
      @milestone_track = MilestoneTrack.new
      @milestone = Milestone.new
      @milestones_all = Milestone.all
  end
end
