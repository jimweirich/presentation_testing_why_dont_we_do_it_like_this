require 'test_helper'

class MissedServiceReasonTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:missed_service_reason).valid?
  end
end
