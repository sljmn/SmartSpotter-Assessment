# frozen_string_literal: true

module Api
  module V1
    class ParticipantsController < ApplicationController
      # you can find these includes in controllers/concers
      include Response
      include ExceptionHandler

      def index
        booking = Booking.find(params[:booking_id])
        render json: booking.participants
      end

      def create
        invitee_id  = params[:invitee_id]
        booking = Booking.find(params[:booking_id])
        @invitation = booking.participants.create!(id:Participant, booking_id:booking, invitee_id:invitee_id)



         if @invitation.save
          render json:   @invitation, status: :created
           puts "user invited! "
        # #  puts @booking.inspect
         else
          render json: @invitation.errors, status: :unprocessable_entity
          puts "something went wrong... try again?"
        end
      end

      def show
        booking = Booking.find(params[:booking_id])
        participant = booking.participants.find(params[:id])
      #  invitation = Participant.find(params[:id])
         render json: participant
         puts booking.inspect
         puts participant.inspect

      end

      def destroy
        # Write your code here
        booking = Booking.find(params[:booking_id])
        participant = booking.participants.find(params[:id])

         puts participant.inspect
         participant.delete

         puts "Invitation canceld"
         render json: "Invitation canceld."

      end



      def participants_params
        params.permit(:invitee_id

        )
      end


    end
  end
end
