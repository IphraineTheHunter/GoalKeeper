class MilestonesController < ApplicationController
    def new
        @milestone = Milestone.new
    end

    def create
        Milestone.create(name: params[:milestone][:name], completed: false, track_id: params[:milestone][:track_id])
        redirect_to :back
    end
end
