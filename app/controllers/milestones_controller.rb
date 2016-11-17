class MilestonesController < ApplicationController
    def new
        @milestone = Milestone.new
    end

    def create
        Milestone.create(name: params[:milestone][:name], completed: false,
            milestone_track_id: params[:milestone][:track_id], progress: params[:milestone][:progress],
                due: params[:milestone][:due])
        redirect_to :back
    end

    def show
        milestone = Milestone.find(params[:track_id], params[:milestone_id])
        if (params[:name])
            milestone.update name: params[:name]
        end
        redirect_to :back
    end

    def update
        milestone = Milestone.find(params[:id])
        milestone.update name: params[:milestone][:name]
        milestone.update due: params[:milestone][:due]
        if params[:milestone][:completed] == '1'
            milestone.update completed: 'true'
            milestone.milestone_track.progress += milestone.progress
            milestone.save
            milestone.milestone_track.save
        end
        redirect_to :back
    end

    def update_form
        @milestone = Milestone.find(params[:id])
        @user = @milestone.milestone_track.user
        render :layout => false
    end
end
