# frozen_string_literal: true

class Room < ApplicationRecord
  # Write your code here
  has_many :bookings, dependent: :destroy


  # how to check if a room is occupied at a certain time....

  def self.check_test
    puts "CHECK ROOM"
  end



end
