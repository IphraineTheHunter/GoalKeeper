require 'test_helper'
require 'devise_helper'
#require 'milestone_tracks_helper' TODO: Figure out why methods aren't found
# => when this helper is defined. It doesn't confuse this with the helper for
# => the controller itself. I'm guessing it's something to do with a scope
# issue.

class MilestoneTrackTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    include ApplicationHelper
    include MilestoneTracksHelpers


    #called at the beginning of every test
    setup do
        progress = 100.0
        numeric_value = 1.0


        @user = User.new(id: 1, email: "example@example.com", name: 'example' )
        @milestone_track = MilestoneTrack.new(id: '1', name: 'Track Name',
            user_id: @user.id, numeric_value: numeric_value, progress: progress)

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

    ###### Tests ######
    test "Can the user view milestone tracks" do
        skip
        get '/users/' + @user.id.to_s + '/milestone_tracks'
        assert_response :success, "Test if you can make get requests"
    end

    test "Can the user create a milestone track" do
        skip
        post '/users/' + @user.id.to_s + '/milestone_tracks',
            {"milestone_track"=>{"name"=>"d", "numeric_value"=>"0"},
                "commit"=>"Create new track", "user_id"=>"1"},
                @ref

        assert @user.milestone_tracks.present?
    end

    test "Can the user set the progress on their milestone track" do
        skip
        #have user create a milestone
        #method defined in test_helper
        create_track

        #sends a patch request to set a milestone's progress
        patch milestone_track_url(@user.milestone_tracks),
            {id: @user.id,
            milestone_track: {progress: 10.0, set: true, milestone_track_id: @user.milestone_tracks.first.id}},
            @ref

        assert @user.milestone_tracks.first.progress == 10.0
    end
end
