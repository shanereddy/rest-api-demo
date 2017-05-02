module V2
  class NurseSerializer < ApplicationSerializer
    attributes :id, :name, :region, :active, :appointments

    def appointments
      v2_nurse_appointments_path(object)
    end
  end
end