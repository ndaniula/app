class UsersController < ApplicationController
  before_action :authenticate_user!
  def dashboard
    @events = current_user.events
    @event = Event.new
    @user = current_user
    @emergency_contacts = EmergencyContact.where(user: current_user)
    @emergency_contact = EmergencyContact.new
  end

  def complete_profile
    @user = current_user
    @user.phone_number = params[:user][:phone_number]
    @user.save
    redirect_to dashboard_path
  end


  def panic_button
    @user = current_user
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
    message = @client.messages.create(body: "Hello, #{@user.first_name} #{@user.last_name} has initiated a state of emergency and you are set as their emergency contact. This link will show you their event details. Please take all necessary mesaures. https://www.localhost:3000/events/#{@user.events.last.slug}",
      from: 'whatsapp:+441618507453',
      to: 'whatsapp:+18033671560')

    redirect_to dashboard_path, notice: "Your emergency contacts have been notified."
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email)
  end
end
