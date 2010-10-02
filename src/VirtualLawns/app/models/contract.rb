class Contract < ActiveRecord::Base
  belongs_to :customer
  belongs_to :sales_rep
  belongs_to :service_type
  has_one :schedule
  has_many :service_trips

  validates_presence_of :customer
  validates_presence_of :sales_rep
  validates_presence_of :service_type
  validates_presence_of :schedule
  validates_presence_of :price_per_visit

  validates_numericality_of :price_per_visit
end
