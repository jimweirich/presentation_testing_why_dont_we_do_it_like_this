class SalesRep < ActiveRecord::Base
  include Named

  has_many :contracts

  validates_presence_of :first_name, :last_name
  validates_presence_of :email
  validates_presence_of :employee_number
  validates_numericality_of :employee_number, :only_integer => :true
  validates_format_of :email, :with => RFC822::LooseEmailAddress
end
