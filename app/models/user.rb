class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_token_authenticatable

  attr_accessor :account_linking_token, :redirect_uri
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: %i[facebook]
  has_many :emergency_contacts, dependent: :destroy
  has_many :events, dependent: :destroy
  validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, uniqueness: true
  # validates :phone_number, presence: true

  # facebook login stuff below
  def self.find_for_facebook_oauth(auth)

    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    #user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h



    user = User.find_by(provider: auth.provider, uid: auth.uid)
      user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
      if user
        user.update(user_params)
      else
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.save
      end

      return user
    end


    def first_next_event
     self.events.where(status: "pending").order(start_date: :asc).first
   end

   def active_event
    self.events.where(status: "active").first
  end



  def trigger_emergency(event)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(
     body: "Hello there, a friend of yours is in danger, please immediatly go to that url: https://www.onguard.live/events/#{Event.last.slug}",
     from: 'whatsapp:+441618507453',
     to: 'whatsapp:+18033671560'
     )
    p "Send message"
  end



end

