require 'date'

def Factory.build_def(name, options={}, &block)
  opts = {:default_strategy => :build}.merge(options)
  Factory.define(name, opts, &block)
end

Fabricate.sequence(:employee_number) do |n| n end

$enum = 1
def enum
  $enum += 1
end

Factory.sequence :code do |n|
  n.to_s(36)
end

Factory.build_def :customer do |user|
  user.first_name { Faker::Name.first_name }
  user.last_name { Faker::Name.last_name }
  user.email { |u|  "#{u.first_name}.#{u.last_name}@#{Faker::Internet.domain_name}".downcase }
end

Factory.build_def :sales_rep do |rep|
  rep.first_name { Faker::Name.first_name }
  rep.last_name { Faker::Name.last_name }
  rep.email { |u|  "#{u.first_name}.#{u.last_name}@virturallawns.com".downcase }
  rep.employee_number { enum }
end

Factory.build_def :service_tech do |rep|
  rep.first_name { Faker::Name.first_name }
  rep.last_name { Faker::Name.last_name }
  rep.employee_number { enum }
end

Factory.build_def :missed_service_reason do |reason|
  reason.description "Testing Reason"
  reason.code { Factory.next(:code) }
end

Factory.build_def :schedule_template do |template|
  template.description "Once a week"
  template.algorithm "weekly"
end

Factory.build_def :schedule do |schedule|
  schedule.starts_on Date.today - 3
  schedule.ends_on Date.today + 7
  schedule.association :schedule_template
end

Factory.build_def :service_type do |service_type|
  service_type.description "Testing Service"
  service_type.code { Factory.next(:code) }
end

Factory.build_def :contract do |service|
  service.association :customer
  service.association :sales_rep
  service.association :service_type
  service.association :schedule
  service.price_per_visit 100.0
end

Factory.build_def :service_trip do |trip|
  trip.association :service_tech
  trip.association :missed_service_reason
  trip.association :contract
  trip.discount 0.0
end
