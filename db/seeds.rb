

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
User.destroy_all
EmergencyContact.destroy_all


user1 = User.create!(first_name: "Lady", last_name: "Gaga", email: "email@email.com", password: "******", phone_number: "087483756234")


event1 = Event.create!(name:"event name", start_date: Time.now, end_date: Time.now, location:"the lawn", description:"Lorem ipsum dolor sit amet, eu mei elit abhorreant, cibo omnis tempor et eam, at eum meliore aliquando. Ad sea tale explicari urbanitas, id falli eirmod scripta his. Eam et ornatus antiopam, ea ius phaedrum efficiendi mediocritatem, eam ut reque omnes putant. Mei ne essent sententiae, vel prompta suscipit accusamus ad, cu tation cetero quo. Ut volumus nostrum definitiones per, et omnis tacimates elaboraret qui. Ex nec putant propriae oporteat, corrumpit cotidieque pro ne. Virtute molestie te mea, ea novum percipitur vix.", user: user1)

emergencycontact1 = EmergencyContact.create(first_name: 'hey', last_name: 'ho', phone_number: 'heoo')
emergencycontact2 = EmergencyContact.create(first_name: 'heyy', last_name: 'hoo', phone_number: 'heoooooo')


15.times do
EventLog.create( description: "some message with details", event: Event.last)
end

# event_log3 = EventLog.create(date_time: Time.now, description: "Lorem ipsum dolor sit amet, eu mei elit abhorreant, cibo omnis tempor et eam, at eum meliore aliquando", event: event1)


