require "test_helper"

class SupporterTest < ActiveSupport::TestCase
  def supporter
    @supporter ||= Supporter.new
  end

  def test_valid
    assert supporter.valid?
  end
end
