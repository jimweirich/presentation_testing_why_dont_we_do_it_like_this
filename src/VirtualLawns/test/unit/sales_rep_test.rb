require 'test_helper'

class SalesRepTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:sales_rep).valid?
  end
end
