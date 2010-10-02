require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:schedule).valid?
  end
end
