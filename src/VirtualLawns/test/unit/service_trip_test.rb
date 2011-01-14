require 'test_helper'
require 'flexmock/test_unit'

class ServiceTripTest < ActiveSupport::TestCase
  test "factory creates valid object" do
    assert Factory.build(:service_trip).valid?
  end

  TIMES = 200

  def bench(label)
    start = Time.now
    yield
    delta = Time.now - start
    printf "%-20s: %0.2f seconds\n", label, delta
  end

  test "Time for Factory.create" do
    bench("Factory.create") {
      TIMES.times do
        trip = Factory.create(:service_trip)
      end
    }
  end

  test "Time for Fabricate" do
    bench("Fabricate.create") {
      TIMES.times do
        trip = Fabricate(:service_trip)
      end
    }
  end

  test "Time for Factory.build" do
    bench("Factory.build") {
      TIMES.times do
        trip = Factory.build(:service_trip)
      end
    }
  end

  test "Time for Mocking" do
    bench("Flexmock") {
      TIMES.times do
        trip = Factory.build(:service_trip,
          :missed_service_reason => flexmock(:model, MissedServiceReason),
          :service_tech => flexmock(:model, ServiceTech),
          :contract => flexmock(:model, Contract))
      end
    }
  end

  test "Time for Custom Build" do
    bench("Raw New") {
      TIMES.times do
        trip = ServiceTrip.new(
          :missed_service_reason => MissedServiceReason.new,
          :service_tech => ServiceTech.new,
          :contract => Contract.new)
      end
    }
  end

  test "Time for Custom Factory" do
    bench("Factory attributes") {
      TIMES.times do
        attrs = Factory.attributes_for(:service_trip)
        attrs.merge(
          :missed_service_reason => MissedServiceReason.new(Factory.attributes_for(:missed_service_reason)),
          :service_tech => ServiceTech.new(Factory.attributes_for(:service_tech)),
          :contract => Contract.new(Factory.attributes_for(:contract)))
        trip = ServiceTrip.new(attrs)
      end
    }
  end

  test "applies discounts to service price (using factories)" do
    trip = Factory.build(:service_trip, :discount => 0.3)
    assert_equal 70.00, trip.amount_charged
  end

  test "applies discounts to service price" do
    contract = flexmock(:model, Contract, :price_per_visit => 100.0)
    trip = Factory.build(:service_trip, :discount => 0.3,
      :contract => contract)
    assert_equal 70.00, trip.amount_charged
  end
end
