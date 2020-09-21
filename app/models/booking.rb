# frozen_string_literal: true

class Booking < ApplicationRecord #::Base
  has_many :participants
  belongs_to :user
  belongs_to :room

  #validates :start_time, :end_time, :overlap => {:load_overlapped => true}

  #validates :start_time, :end_time, :overlap => true




#
#   # Write your code here
    def self.test(params)
#


  start_time = params[:start_time].to_i
  puts start_time.class
  end_time = params[:end_time].to_i
  date = params[:date]
  room_id = params[:room_id]

   bookings_that_day = bookings = Booking.where('date BETWEEN ? AND ?', @date, @date) #.where('room_id = ?', room_id)

  bookings_that_day = bookings = Booking.where('date = ?', date).where('room_id = ?', room_id)

     puts "ON DATE #{date} we have #{bookings_that_day.size} bookings"

     bookings_that_day.inspect
     ts = TimeSlot.new start_time..end_time
     #puts ts
      bookings_that_day.each do |booking|
     #
     x = ts.match booking.start_time..booking.end_time
     puts "there is #{x.size} match in that time slot, so it is occupied. Book another time slot, please. "
     puts x.inspect
     puts "SEEE ABOVE"
    puts  booking.start_time.inspect
    puts booking.end_time.inspect
     #   puts ts
     #
      end


  # de ingevoerde start en end time matchen met alle bookeings op die dag

  # als er een match is, afwijzen
  # als er een match is = overlap = true
  # als overlap true is, create action niet uitvoeren!



  puts ts.inspect

puts "TSS"
#       require 'time'
#       puts "Initialize....."
#       puts params
#       @start_time = Time.parse(params[:start_time]).strftime("%H:%M")
#       puts @start_time
#       @start_time = Time.parse(params[:start_time]).strftime("%H:%M")
#       @end_time = Time.parse(params[:end_time]).strftime("%H:%M")
#     #  @end_time = DateTime.now.to_s(:end_time).strftime("%H:%M")
#       @date = Time.parse(params[:date])
#        #@date = params[:date]
#
#        @room_id = params[:room_id]
#        log_booking
#        end
#
#     def self.log_booking
#       puts "from the booking.rb modal!"
#
#       #check_room
#      puts "starttime #{@start_time} and end time #{@end_time} on #{@date}, in room #{@room_id} "
#      puts  DateTime.now.between?(@start_time, @end_time)
#     is_available
#
   end
#
#
#
#     def self.is_available
#
#
#       #  puts " get all bookings for this room"
#       #
#       #
#        bookings_that_day = Booking.where("DATE(date) = ?", @date)
#       #
#        puts "ON DATE #{@date} we have #{bookings_that_day.size} bookings"
#       #
#       # bookings_that_day.each do |booking|
#       #   puts booking.start_time
#       #   puts booking.end_time
#       #   is_available?(booking)
#       #
#       # end
#       # puts "DATE"
#       # puts @date
#        x = Booking.where(['start_time < ? AND end_time > ?', @date, @date])
#        puts "somethingn new, like size"
#        puts x
#       # puts x.size
#
#
#     end
#
#
#
#
#
# def self.check_room
# #  Room.check_test
# end
#
#    def self.is_available?(booking)
#
#      puts booking.id
#   #   puts booking.start_time == booking.end_time
#     puts  DateTime.now.between?(@start_time, @end_time)
#     end
#
#     def overlapped_records
#    @overlapped_records || []
#  end

end

class Slot
  include SlotMachine::Slot
end
