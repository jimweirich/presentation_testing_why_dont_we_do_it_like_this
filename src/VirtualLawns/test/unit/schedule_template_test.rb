require 'test_helper'

class ScheduleTemplateTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:schedule_template).valid?
  end
end
