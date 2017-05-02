class Nurse < ApplicationRecord
  has_many :appointments
  
  validates_presence_of :name
  validates_presence_of :region
end
