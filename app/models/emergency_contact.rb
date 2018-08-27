class EmergencyContact < ApplicationRecord
  belongs_to :user
  has_many :emergency_contact_events, dependent: :destroy
  has_many :events, through: :emergency_contact_events
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
end
