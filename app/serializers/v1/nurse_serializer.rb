module V1
  class NurseSerializer < ApplicationSerializer
    attributes :id, :name, :region, :active
  end
end