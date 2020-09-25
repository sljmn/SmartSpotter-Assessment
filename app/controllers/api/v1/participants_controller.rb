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


        render json: booking.participants
        puts booking.inspect

      end
      def create
        puts "**********************"
        puts "CREATE ParticipantsController"
        puts "**********************"

          booking = Booking.find(params[:booking_id])
          puts "participants"
          puts participants_params
          puts booking.participants.inspect
          render json: booking.participants

        @participant =  current_user.bookings.build(participants_params)
        puts participants_params.inspect
        puts "****************************************"
        puts @participant.inspect

        booking = Booking.find(params[:booking_id])
        puts booking.inspect
        @invitation = booking.participants.create!(id:Participant, booking_id:"167", invitee_id:"2")

        puts "***************** invitation ***********************"
        @invitation.inspect

      end

      def participants_params
        params.permit(

        )
      end


    end
  end
end
