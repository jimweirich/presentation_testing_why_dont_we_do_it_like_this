require 'test_helper'

class ContractTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:contract).valid?
  end
end
