require 'date'

Factory.sequence :employee_number do |n|
  n
end

Factory.sequence :code do |n|
  n.to_s(36)
end

Factory.define :customer do |user|
  user.first_name { Faker::Name.first_name }
  user.last_name { Faker::Name.last_name }
  user.email { |u|  "#{u.first_name}.#{u.last_name}@#{Faker::Internet.domain_name}".downcase }
end

Factory.define :sales_rep do |rep|
  rep.first_name { Faker::Name.first_name }
  rep.last_name { Faker::Name.last_name }
  rep.email { |u|  "#{u.first_name}.#{u.last_name}@virturallawns.com".downcase }
  rep.employee_number { Factory.next(:employee_number) }
end

Factory.define :service_tech do |rep|
  rep.first_name { Faker::Name.first_name }
  rep.last_name { Faker::Name.last_name }
  rep.employee_number { Factory.next(:employee_number) }
end

Factory.define :missed_service_reason do |reason|
  reason.description "Testing Reason"
  reason.code { Factory.next(:code) }
end

Factory.define :schedule_template do |template|
  template.description "Once a week"
  template.algorithm "weekly"
end

Factory.define :schedule do |schedule|
  schedule.starts_on Date.today - 3
  schedule.ends_on Date.today + 7
  schedule.association :schedule_template
end

Factory.define :service_type do |service_type|
  service_type.description "Testing Service"
  service_type.code { Factory.next(:code) }
end

Factory.define :contract do |service|
  service.association :customer
  service.association :sales_rep
  service.association :service_type
  service.association :schedule
  service.price_per_visit 100.0
end

Factory.define :service_trip do |trip|
  trip.association :service_tech
  trip.association :missed_service_reason
  trip.association :contract
  trip.discount 0.0
end
