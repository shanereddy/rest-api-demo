class Nurse < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :region
end
