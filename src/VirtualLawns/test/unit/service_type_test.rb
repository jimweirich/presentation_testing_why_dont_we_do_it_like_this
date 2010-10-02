require 'test_helper'

class ServiceTypeTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:service_type).valid?
  end
end
