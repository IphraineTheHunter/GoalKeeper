ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"
require "rack/test"
require 'milestone_tracks_helper'
Minitest::Reporters.use!

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end

module MilestoneTracksHelpers
    def create_track
        post '/users/' + @user.id.to_s + '/milestone_tracks',
            {"milestone_track"=>{"name"=>"Track Name", "numeric_value"=>"100.0"},
                "commit"=>"Create new track", "user_id"=>"1"},
                @ref
    end
end
