class MilestoneTracksController < ApplicationController
    before_action :authenticate_user!

    def index
      @user = User.find(params[:user_id])
      @milestone_track = MilestoneTrack.new
      @milestone = Milestone.new
      @milestones_all = Milestone.all
    end

    def create
        current_user.milestone_tracks.create(name: params[:milestone_track][:name])
        redirect_to :back
    end

    #def show

    #end
end
