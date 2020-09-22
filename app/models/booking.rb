# frozen_string_literal: true

class Booking < ApplicationRecord #::Base
  has_many :participants
  belongs_to :user
  belongs_to :room

  validates :start_time, :end_time, :overlap => {:scope => "room_id"}




#
#     def self.test(params)
#
#       start_time = params[:start_time]
#       end_time = params[:end_time]
#       date = params[:date]
#       room_id = params[:room_id]
#
# puts "***************params*************************"
#       puts start_time
#       puts end_time
#       puts date
#
#       puts "*************vrom de booking.rb***************************"
#       puts params.inspect
#
#
# bookings_that_day = Booking.where('start_time < ?', 1.hour.ago).where('end_time > ?', 1.hour.ago)
#
# puts "************bookingsthatday****************************"
# puts bookings_that_day.inspect
#
#
#   # bookings_that_day = bookings = Booking.where('date = ?', date).where('room_id = ?', room_id)
#
#   #   puts "ON DATE #{date} we have #{bookings_that_day.size} bookings"
#
#
# end


end
