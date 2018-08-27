

# include Facebook::Messenger



# Bot.on :message do |message|
#   byebug
#   puts "i'm new folder"
#   user = User.find_by_sender_id message.sender["id"]
#   start_survey(message)
# end

# Bot.on :postback do |postback|
#   puts "postbak"
#   messenger_id = postback.sender['id']
#   user = User.find_by_sender_id message.sender["id"]
#   execute_survey(postback, nil)
# end

# var state = '000';

# def start_survey(message =nil)
#   puts "before"
#   if (message.text == "hello")
#     puts "after"
#     send_first_message(message)
#   else
#     message.reply(text: "Say 'hello' to start :) ")
#   end
# end

# def send_first_message message
#   message.reply(text: "Please send 'Location' for location, 'Names' for names 'Description' for description. I will store all your answers :) ")
#     if (message.text == "Location")
#       message.reply(text: "Please send your location.")
#       if (message.text == "[\s\S]+")
#     end
#     elsif (message.text == "Names")
#       message.reply(text: "Please send some names.")
#     elsif (message.text == "Description")
#       message.reply(text: "Please send a description.")
#     else
#       message.reply(text: "Remember, 'Location' for location, 'Names' for names 'Description' for description.")
#   end


# end

# # def execute_survey (postback = nil, message =nil)
# #   answer = postback.payload

# #   case answer
# #   when "START_USER_SURVEY"
# #     puts 'Ask zeroth question'
# #     sendmessage_opt(postback)
# #   when "LOCATION"
# #     puts 'Location'
# #     sendlocation_opt(postback)
# #   when "NAMES"
# #     puts 'na'
# #     sendnames_opt(postback)
# #   when "ELSE"
# #     puts 'else'
# #     sendelse_opt(postback)

# #   else
# #     puts "Somehow you sent an invalid postback value!"
# #   end
# # end


# # def send_first_message message
# #   puts "hereééé"
# #   message.reply(
# #     attachment: {
# #       type: 'template',
# #       payload: {
# #         template_type: 'button',
# #         text: 'What do you want to share',
# #         buttons: [
# #           { type: 'postback', title: 'Location', payload: 'LOCATION' },
# #           { type: 'postback', title: 'Names', payload: 'NAMES' },
# #           { type: 'postback', title: 'Else', payload: 'ELSE' }
# #         ]
# #       }
# #     }
# #   )
# # end

# def sendmessage_opt postback
#   puts "im in 32"
#   postback.reply(
#     attachment: {
#       type: 'template',
#       payload: {
#         template_type: 'button',
#         text: 'What do you want to share',
#         buttons: [
#           { type: 'postback', title: 'Location', payload: 'LOCATION' },
#           { type: 'postback', title: 'Names', payload: 'NAMES' },
#           { type: 'postback', title: 'Else', payload: 'ELSE' }
#         ]
#       }
#     }
#   )
# end

# # def ask_first_question postback
# #   postback.reply(
# #     attachment: {
# #       type: 'template',
# #       payload: {
# #         template_type: 'button',
# #         text: 'This is the first question. It has three buttons to answer from',
# #         buttons: [
# #           { type: 'postback', title: 'Button one', payload: 'ANSWER_ONE_ONE' },
# #           { type: 'postback', title: 'Button two', payload: 'ANSWER_ONE_TWO' },
# #           { type: 'postback', title: 'Button three', payload: 'ANSWER_ONE_THREE' }
# #         ]
# #       }
# #     }
# #   )
# # end

# # def ask_second_question postback
# #   postback.reply(
# #     attachment: {
# #       type: 'template',
# #       payload: {
# #         template_type: 'button',
# #         text: 'This is the second question. It works just like the first one ;)',
# #         buttons: [
# #           { type: 'postback', title: 'Button one', payload: 'ANSWER_TWO_ONE' },
# #           { type: 'postback', title: 'Button two', payload: 'ANSWER_TWO_TWO' },
# #           { type: 'postback', title: 'Button three', payload: 'ANSWER_TWO_THREE' }
# #         ]
# #       }
# #     }
# #   )
# # end

# def show_result postback, user
#   #Get sesult from User model
#   surname = user.first_name
#   result = user.get_answers
#   postback.reply(text: "Ok #{surname}, Here are your answers to the questions")
#   postback.reply(text: "#{result}")
# end

# def exit_survey postback
#     # you can also send photos by including a URL in the payload response
#     postback.reply(
#     attachment: {
#       type: 'image',
#       payload: {
#         url: 'http://s2.quickmeme.com/img/ee/ee71aaef710f28451bb40f142ce53d35ce50405caafdfdb53e73417fc2619af3.jpg'
#       }
#     }
#   )
# end

# # User Functionality
# def get_user messenger_id
#   @user = User.where(messenger_id: messenger_id).first
#   # If user does not exist, create new
#   create_new_user(messenger_id) unless @user
# end

# def set_answer user
#   user_id = user.id
#   @answer = Answer.where(user_id: user_id).first
#   # If answer does not exist, create new
#   create_new_answer(user_id) unless @answer
# end

# def create_new_answer(user_id)
#   @answer = Answer.new(user_id: user_id)
#   @answer.save
# end

# # def create_new_user(messenger_id)
# #   @user = User.new(messenger_id: messenger_id)

# #   # Get user info from Messenger User Profile API
# #   url = "https://graph.facebook.com/v2.6/#{messenger_id}?fields=first_name,last_name,gender&access_token=#{ENV["ACCESS_TOKEN"]}"
# #   user_data = api_call(url)

# #   # Store user's name and gender
# #   @user.first_name = user_data["first_name"]
# #   @user.last_name = user_data["last_name"]
# #   @user.gender = user_data["gender"]
# #   @user.save
# # end

# def api_call(url)
#   require 'json'
#   require 'open-uri'
#   user_data = JSON.parse(open(url).read)
# end
