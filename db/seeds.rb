# frozen_string_literal: true

require 'faker'

puts 'Deleting all records'

Participant.delete_all
Booking.delete_all
Room.delete_all
User.delete_all

name = Faker::Games::Pokemon.location

puts 'Creating rooms'

5.times do
  Room.create!(name: name)
end

puts 'Rooms created'