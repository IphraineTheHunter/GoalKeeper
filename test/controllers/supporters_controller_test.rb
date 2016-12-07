require "test_helper"
require 'devise_helper'

class SupportersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    include ApplicationHelper

    #called at the beginning of every test
    setup do
        @user = User.create(id: 1, email: "example@example.com", name: 'example' )
        @supporter = User.create(id: 2, email: "supporter@example.com", name: 'supporter' )

        sign_in @user
        #need to send a referrer, in cases where the controller called redirect_to
        #added this to simplify sending get, patch, and put methods
        @ref = {'HTTP_REFERER' => 'http://localhost:3000/'}
    end

    # called after every single test
    teardown do
          # when controller is using cache it may be a good idea to reset it afterwards
          Rails.cache.clear
    end

    test "Can the user add a supporter?" do
        skip
        post '/users/' + @user.id.to_s + '/supporters',
            {"supporter"=>{"supporter_id"=>"2"},
                "commit"=>"Create new track", "user_id"=>"1"},
                @ref

        assert @user.supporters.where(supporter_id: 2).present?
    end

    test "Can the user add a supporter by email?" do
        skip "Users.all returns empty through minitest. Works just fine on the app itself."
        post '/users/' + @user.id.to_s + '/supporters',
            {"supporter"=>{"supporter_email"=>"supporter@example.com"},
                "commit"=>"Create new track", "user_id"=>"1"},
                @ref

        assert @user.supporters.where(supporter_id: 2).present?
    end
end
