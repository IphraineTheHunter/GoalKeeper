class MilestonesController < ApplicationController
    def new
        @milestone = Milestone.new
    end

    def create
#        render plain: params.inspect
        if params[:milestone][:m_id].present?
            milestone = Milestone.find(params[:milestone][:m_id])
            milestone.update name: params[:milestone][:name]
            if params[:milestone][:completed] == '1'
                milestone.update completed: 'true'
            end
        else
            Milestone.create(name: params[:milestone][:name], completed: false, track_id: params[:milestone][:track_id], number: params[:milestone][:number])
        end
        redirect_to :back
    end

    def show
        milestone = Milestone.find(params[:track_id], params[:milestone_id])
        if (params[:name])
          milestone.update name: params[:name]
        end
        redirect_to :back
    end
end
