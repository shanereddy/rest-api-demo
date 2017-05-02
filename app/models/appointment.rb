class Appointment < ApplicationRecord
  belongs_to :nurse

  validates_presence_of :appointment_date, :starttime, :endtime
end
