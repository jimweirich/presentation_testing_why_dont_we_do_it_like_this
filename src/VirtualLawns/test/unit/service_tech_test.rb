require 'test_helper'

class ServiceTechTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:service_tech).valid?
  end
end
