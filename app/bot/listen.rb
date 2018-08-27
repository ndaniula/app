include Facebook::Messenger

#an event can be pending, active or close. An user can have just one active event, not more.
Bot.on :message do |message|
  #we find the user into the database
  user = User.find_by_sender_id message.sender["id"]
  #we check if the message is text, photo or location(location still to implement). The method is defined at the end of the page. We store the string that we want to save in a variable called text
  text = set_text(message)
  puts "hey"
  #check if user exists
if user
  #check if user has events
  if user.events.any?
    #check if user has active events events -> In case true we know that we have to store all the messages that he's sending in the log, except for help or stop
    if user.events.where(status: "active").any?
      #trigger the emergency
      if (text == "help")
        #we select the only active event
         event = user.active_event
         #trigger the contact
         message.reply(text: "Your details have been sent to your emergency contact")
         user.trigger_emergency(event)
      # close the event
      elsif (text == "stop")
          event = user.active_event
          event.status = "close"
          message.reply(text: "The bot is shutting down. The event #{event.name} is finished")
          event.save
          EventLog.new(description: "Stopped", event: event).save
      #register the message in the log for the event
      else
          event = user.active_event
          EventLog.new(description: text, event: event).save
          message.reply(text: "Your info has been stored, anything else ?")
      end
    #The method first_next_event is defined in the user model and it will order all the events checking the start date. The first event will be the closest. Fisrt we check that User has pending event that are ready to start, than we check that the event start date is less than TimeNow: ex the event is at 18.00 and we text at 18.01. The bot automatically knows that he has to start to track that event. If yes we create a new event log and we sart to track the event (event: active)
    elsif user.events.where(status: "pending").any? && user.first_next_event.start_date <= (Time.now + 8.hour)
        event = user.first_next_event
        event.status = "active"
        EventLog.new(description: "OnGuard is protecting  for the event #{event.name}", event: event).save
        EventLog.new(description: "#{text}", event: event).save
        event.save
        message.reply(text: "Hello #{user.first_name}! I'm starting to register your event #{event.name}. The end time is set for #{event.end_date.strftime("%b %e, %l:%M %p")}. Have a nice time :) ")
    #In this case we have events ready to be started but we write too early. The bot will order the event with the methods first_next_event and will tell us the date of our next event
    elsif user.events.where(status: "pending").any? && !(user.first_next_event.start_date < (Time.now + 8.hour))
        event = user.first_next_event
        message.reply(text: waiting_for_a_new_event(user, event) )
    else
    #No events
      message.reply(text: "You don't have any event")
    end
  else
    #NO events
    message.reply(text: "You don't have any event")
  end
else
  # send loging button to autenticathe user
  message.reply(
    attachment: {
      type: 'template',
      payload: {
        template_type: 'button',
        text: 'Please Login on OnGuard and come back to start :)',
        buttons: [
          {
            type: 'account_link',
            url: 'https://www.onguard.live/users/sign_in'
          },
        ]
      }
    }
  )
end

end

Bot.on :account_linking do |linking|
  user = User.find_by_authentication_token linking.authorization_code
  if user
    user.sender_id = linking.messaging["sender"]["id"]
    user.save
  end
end


def waiting_for_a_new_event(user, event)
 return "Hey #{user.first_name}. Sems like you don't have any event now! Your next event #{event.name} will start #{event.start_date.strftime("%b %e, %l:%M %p")}"
end

#we call this method at the beginning of the bot to know if the message is a photo, a location or a test. In these cases we store the message to save or the link of the photo in the variable text
def set_text(message)
  text = ""
  if !message.attachments.nil?
    if message.attachments.first["type"] == "image"
      text = message.attachments.first["payload"]["url"]
    elsif message.attachments.first["url"]
      text = message.attachments.first["url"]
    end
  elsif !message.text.empty?
    text = message.text
  end
  return text
 end



