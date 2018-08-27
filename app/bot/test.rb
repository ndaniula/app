# include Facebook::Messenger

# Bot2.on :message do |message|
#   user = User.find_by_sender_id message.sender["id"]
#   if user
#   message.reply(text: "What do you want to share with me ?")
#     puts "hello"
#     if (text == "hey")
#     message.reply(text: "Great, those details have been updated")
#     else
#     message.reply(text: "Don't forget to keep me posted !")
#     end
#   else
#     # send loging button
#     message.reply(
#       attachment: {
#         type: 'template',
#         payload: {
#           template_type: 'button',
#           text: 'Please Login!',
#           buttons: [
#             {
#               type: 'account_link',
#               url: 'https://718bd6d0.ngrok.io/users/sign_in'
#             },
#           ]
#         }
#       }
#     )
#   end
# end

# Bot.on :account_linking do |linking|
#   user = User.find_by_authentication_token linking.authorization_code
#   if user
#     user.sender_id = linking.messaging["sender"]["id"]
#     user.save
#   end
# end
