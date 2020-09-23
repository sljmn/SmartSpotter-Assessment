# frozen_string_literal: true

module Api
  module V1
    class ParticipantsController < ApplicationController
      # you can find these includes in controllers/concers
      include Response
      include ExceptionHandler

      # Write your code here

      def index
        booking = Booking.find(params[:booking_id])
        puts "something"

        render json: booking
        puts booking.inspect

      end
      def create
        puts "**********************"
        puts "CREATE ParticipantsController"
        puts "**********************"
          booking = Booking.find(params[:booking_id])
          puts "participants"
          puts booking.participants.inspect
          render json: booking.participants

        @participant =  current_user.bookings.build(participants_params)
        puts @participant.inspect


      end

      def participants_params
        params.permit(
          :id
        )
      end


    end
  end
end
