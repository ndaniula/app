class Event < ApplicationRecord
  belongs_to :user
  has_many :emergency_contact_events, dependent: :destroy

  has_many :event_logs, dependent: :destroy
  has_many :emergency_contacts, through: :emergency_contact_events

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :start_date_must_be_before_the_end_date
  #before_save :create_token
  before_create :set_slug
  #before_create :set_event_number
  accepts_nested_attributes_for :emergency_contacts
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  # def create_token
  #   string = ""
  #   4.times do
  #     string += ("a"..."z").to_a.sample
  #   end
  #   self.token = string
  # end

  def start_date_must_be_before_the_end_date
    if start_date > end_date
      errors.add(:start_date, "must be before an end date!")
    end
  end

  def set_slug
    loop do  self.slug = SecureRandom.uuid
      break unless Event.where(slug: slug).exists?
    end
  end

  # def set_event_number
  #   loop do self.event_number = SecureRandom.hex(2)
  #     break unless Event.where(event_number: event_number).exists?
  #   end
  # end


end

