# frozen_string_literal: true

class Booking < ApplicationRecord
  has_many :participants
  belongs_to :user
  belongs_to :room

  # Write your code here
     def self.test(params)

      require 'time'
      puts "Initialize....."
      puts params
      @start_time = Time.parse(params[:start_time]).strftime("%H:%M")
      puts @start_time
      @start_time = Time.parse(params[:start_time]).strftime("%H:%M")
      @end_time = Time.parse(params[:end_time]).strftime("%H:%M")
    #  @end_time = DateTime.now.to_s(:end_time).strftime("%H:%M")
      @date = Time.parse(params[:date])
       #@date = params[:date]

       @room_id = params[:room_id]
       log_booking
       end

    def self.log_booking
      puts "from the booking.rb modal!"

      check_room
     puts "starttime #{@start_time} and end time #{@end_time} on #{@date}, in room #{@room_id} "
    is_available

   end

    def self.is_available

  
       puts " get all bookings for this room"


       bookings_that_day = Booking.where("DATE(date) = ?", @date)

       puts "ON DATE #{@date} we have #{bookings_that_day.size} bookings"

      bookings_that_day.each do |booking|
        puts booking.start_time
        puts booking.end_time
        is_available?(booking)

      end
    end


def self.check_room
  Room.check_test
end

   def self.is_available?(booking)

     puts booking.id
  #   puts booking.start_time == booking.end_time
    puts  DateTime.now.between?(@start_time, @end_time)
    end

end
