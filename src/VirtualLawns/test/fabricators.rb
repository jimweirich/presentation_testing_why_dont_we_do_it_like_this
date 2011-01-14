require 'date'

# Fabricate.sequence(:employee_number)

# Fabricate.sequence :code do |n|
#   n.to_s(36)
# end

Fabricator(:customer) do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { |u|  "#{u.first_name}.#{u.last_name}@#{Faker::Internet.domain_name}".downcase }
end

Fabricator :sales_rep do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  email { |u|  "#{u.first_name}.#{u.last_name}@virturallawns.com".downcase }
  employee_number { Fabricate.sequence(:employee_number) }
end

Fabricator :service_tech do
  first_name { Faker::Name.first_name }
  last_name { Faker::Name.last_name }
  employee_number { Fabricate.sequence(:employee_number) }
end

Fabricator :missed_service_reason do
  description "Testing Reason"
  code { Fabricate.sequence(:code) }
end

Fabricator :schedule_template do
  description "Once a week"
  algorithm "weekly"
end

Fabricator :schedule do
  starts_on Date.today - 3
  ends_on Date.today + 7
  schedule_template { Fabricate(:schedule_template) }
end

Fabricator :service_type do
  description "Testing Service"
  code { Fabricate.sequence(:code) }
end

Fabricator :contract do
  customer { Fabricate(:customer) }
  sales_rep { Fabricate(:sales_rep) }
  service_type { Fabricate(:service_type) }
  schedule { Fabricate(:schedule) }
  price_per_visit 100.0
end

Fabricator :service_trip do
  contract! { Fabricate(:contract) }
  missed_service_reason { Fabricate(:missed_service_reason) }
  service_tech! { Fabricate(:service_tech) }
  discount 0.0
end
