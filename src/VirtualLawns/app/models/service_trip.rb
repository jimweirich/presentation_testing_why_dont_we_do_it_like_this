class ServiceTrip < ActiveRecord::Base
  belongs_to :contract
  belongs_to :service_tech
  belongs_to :missed_service_reason

  validates_presence_of :contract
  validates_presence_of :service_tech
  validates_presence_of :discount
  validates_numericality_of :discount

  def amount_charged
    (1 - discount) * contract.price_per_visit
  end
end
