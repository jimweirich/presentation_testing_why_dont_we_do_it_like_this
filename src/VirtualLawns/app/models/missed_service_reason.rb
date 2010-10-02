class MissedServiceReason < ActiveRecord::Base
  has_many :service_trips

  validates_presence_of :description
  validates_presence_of :code
  validates_uniqueness_of :code
  validates_length_of :code, :within => 1..2
end
