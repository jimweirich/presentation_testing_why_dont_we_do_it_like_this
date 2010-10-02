class ScheduleTemplate < ActiveRecord::Base
  has_many :schedules

  validates_presence_of :description, :algorithm
end
