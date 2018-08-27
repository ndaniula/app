class EmergencyContactEvent < ApplicationRecord
  belongs_to :emergency_contact
  belongs_to :event
end
