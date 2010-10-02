# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

ServiceType.create(:description => "Lawn Mowing",   :code => "LM")
ServiceType.create(:description => "Tree Trimming", :code => "TT")
ServiceType.create(:description => "Edging",        :code => "ED")

MissedServiceReason.create(:description => "Inclement Weather", :code => "WE")
MissedServiceReason.create(:description => "Customer Not Home", :code => "NH")
