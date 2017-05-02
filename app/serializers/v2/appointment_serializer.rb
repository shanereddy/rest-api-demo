module V2
  class AppointmentSerializer < ApplicationSerializer
    attributes :id, :appointment_date, :starttime, :endtime

    def starttime
      object.starttime.to_formatted_s(:time)
    end

    def endtime
      object.endtime.to_formatted_s(:time)
    end
  end
end
