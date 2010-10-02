class ServiceTech < ActiveRecord::Base
  include Named

  set_table_name 'service_techs'
  has_many :service_trips

  validates_presence_of :first_name, :last_name
  validates_presence_of :employee_number
  validates_numericality_of :employee_number, :only_integer => :true
end
