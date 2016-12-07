class MilestoneTracksController < ApplicationController
    before_filter :validate_user

    def index
      @user = User.find(params[:user_id])
      @milestone_track = MilestoneTrack.new
      @milestone = Milestone.new
      @milestones_all = Milestone.all
    end

    def create
        current_user.milestone_tracks.create(name: params[:milestone_track][:name],
            numeric_value: params[:milestone_track][:numeric_value], progress: 0)
        redirect_to :back
    end

    def update
      milestone_track = MilestoneTrack.find(params[:milestone_track][:milestone_track_id])
      if params[:milestone_track][:set] == 'true'
          milestone_track.update progress: params[:milestone_track][:progress].to_f
      else
          milestone_track.progress += params[:milestone_track][:progress].to_f
      end

      milestone_track.milestones.each do |m|
          if m.progress.present?
              if m.progress <= milestone_track.progress
                  m.update completed: 'true'
              end
          end
      end

      milestone_track.save
      redirect_to :back
    end


    def create_form
#        byebug
        @milestone_track = MilestoneTrack.find(params[:id])
        @milestone = Milestone.new
        render :layout => false
    end

    def update_progress
        @milestone_track = MilestoneTrack.find(params[:id])
        @user = @milestone_track.user
        render :layout => false
    end

    private
        def validate_user
            if params[:action] == "update_progress"
                milestone_track = MilestoneTrack.find(params[:id])
                render nothing: true unless current_user.id == milestone_track.user_id
            end
            if params[:milestone_track_id].present?
                milestone_track = MilestoneTrack.find(params[:milestone_track_id])
                render nothing: true unless current_user.id == milestone_track.user_id
            end
        end
end
