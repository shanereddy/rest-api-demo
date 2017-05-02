class Appointment < ApplicationRecord
  belongs_to :nurse

  validates_presence_of :appointment_date, :starttime, :endtime
  validates_uniqueness_of :appointment_date, scope: [:starttime, :endtime], message: "This appointment is already taken"
  validates_uniqueness_of :starttime, scope: [:appointment_date, :endtime], message: "This appointment is already taken"
  validates_uniqueness_of :endtime, scope: [:appointment_date, :starttime], message: "This appointment is already taken"
end
