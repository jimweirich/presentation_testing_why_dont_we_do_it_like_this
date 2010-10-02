class Schedule < ActiveRecord::Base
  has_one :contract
  belongs_to  :schedule_template

  validates_presence_of :starts_on, :ends_on
end
