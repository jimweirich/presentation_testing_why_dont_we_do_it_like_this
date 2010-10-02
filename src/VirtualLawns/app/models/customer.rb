class Customer < ActiveRecord::Base
  include Named

  has_many :contracts

  validates_presence_of :first_name, :last_name
  validates_presence_of :email

  validates_format_of :email, :with => RFC822::LooseEmailAddress
end
