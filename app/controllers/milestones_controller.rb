class MilestonesController < ApplicationController
    before_filter :validate_user

    def new
        @milestone = Milestone.new
    end

    def create
        Milestone.create(name: params[:milestone][:name], completed: false,
            milestone_track_id: params[:milestone][:track_id], progress: params[:milestone][:progress],
                due: params[:milestone][:due])
        redirect_to :back
    end

    def update
        milestone = Milestone.find(params[:id])
        if params[:milestone][:remove] == 'true'
            milestone.delete
            redirect_to :back
        else
            milestone.update name: params[:milestone][:name]
            milestone.update due: params[:milestone][:due]
            if params[:milestone][:completed] == '1'
                milestone.update completed: 'true'
                if milestone.progress.present?
                    milestone.milestone_track.progress += milestone.progress
                end
                milestone.save
                milestone.milestone_track.save
            end
            redirect_to :back
        end
    end

    def update_form
        @milestone = Milestone.find(params[:id])
        @user = @milestone.milestone_track.user
#        render plain: current_user.inspect

        render :layout => false
    end


    private
        def validate_user
            unless params[:id].present? == false
                milestone = Milestone.find(params[:id])
                milestone_owner = milestone.milestone_track.user_id
                render nothing: true unless current_user.id == milestone_owner
            else
                milestone_track = MilestoneTrack.find(params[:milestone_track_id])
                render nothing: true unless current_user.id == milestone_track.user_id
            end
        end
end
