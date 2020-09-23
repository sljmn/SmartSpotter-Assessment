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
        puts "CREATE ParticipantsController"
      end
    end
  end
end
