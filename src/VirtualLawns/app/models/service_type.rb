class ServiceType < ActiveRecord::Base
  has_many :services

  validates_presence_of :description
  validates_presence_of :code
  validates_uniqueness_of :code
  validates_length_of :code, :within => 1..2
end
