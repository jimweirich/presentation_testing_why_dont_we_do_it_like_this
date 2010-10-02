require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:customer).valid?
  end
end
