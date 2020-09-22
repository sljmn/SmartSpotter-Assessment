# frozen_string_literal: true

module Api
  module V1
    class BookingsController < ApplicationController
      # you can find these includes in controllers/concerns
      include Response
      include ExceptionHandler
      include ActionController::MimeResponds


      def index
      #  @bookings = Booking.all
      #  booking = Booking.find(params[:id])
        rooms = Room.find(params[:room_id])
        bookings = rooms.bookings.all
          render json: bookings
      #  json_response(bookings)
      #  render json: bookings

      end



      def create

      @booking =  current_user.bookings.build(booking_params)
      booking = Booking.test(booking_params)



      puts params.inspect

       puts @booking.inspect


      #  if Booking.vrij == true
      #    puts "from bookings#controller is wel beshcikbaar. WEL VRIJ"
      #
      # else
      #   puts  "from de bookings#controller, not avail i guess NIET VRIJ"
      #
      #  end

        if @booking.save
          render json: @booking
          puts "SAVED"
        else
          render json: "something went wrong..."

        end
      end



      def show
        # Write your code here


        @booking = Booking.find(params[:id])

        @rooms = Room.find(params[:room_id])
          render json: @booking
          render json: "TEST"
      end



      def update
        # Write your code here
      end

      def destroy
        # Write your code here
      end

      private



        # Write your code here

        def booking_params
          params.permit(
            :start_time,
            :end_time,
            :date,
            :room_id,
            :user_id
          )
        end

      end
    end
  end
