class SupportersController < ApplicationController
    before_filter :validate_user

    def index
        @users = User.all
        @user = User.find(params[:user_id])
        @supporter = Supporter.new
        @milestones_all = Milestone.all
    end

    def create
        @users = User.all
        # Add a user by Email
        if params[:supporter][:supporter_id].present?
            supporter = @users.find_by(email: params[:supporter][:supporter_id])
            unless supporter.nil?
                unless current_user.supporters.find_by(supporter_id: supporter.id).present?
                    current_user.supporters.create(supporter_id: supporter.id)
                end
            end
        end

        redirect_to :back
    end

    private
        def validate_user
#            render plain: params.inspect
            redirect_to(root_url) unless current_user.id.to_s == params[:user_id] or current_user.id.to_s == params[:id]
        end
end
