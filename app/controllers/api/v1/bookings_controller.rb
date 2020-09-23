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
        # rooms = Room.find(params[:room_id])
        # bookings = rooms.bookings.all
      #  @all_bookings = Booking.all
        @booking = Room.find(params[:room_id]).bookings
        puts @booking.inspect



      render json: @booking

      #  render json: @all_bookings
      #  json_response(bookings)
      #  render json: bookings

      end







      def create

      @booking =  current_user.bookings.build(booking_params)





        if @booking.save
          render json: @booking, status: :created 
          puts "booking saved!"
        #  puts @booking.inspect
        else
          render json: @booking.errors, status: unpro
          puts "something went wrong... this time slot isnt available, try another room/ date or timeslot!"



        end
      end



      def show
        # Write your code here
        @room = Room.find(params[:room_id])
      #  @category = Category.friendly.find(params[:category_id])


         booking = @room.bookings
         puts @booking.inspect
        #
        #
        #
         render json: booking

      end



      def update
        # Write your code here
      end

      def destroy
        # Write your code here
        @booking = current_user.bookings.find(params[:id])
        puts @booking.inspect
        @booking.destroy
        puts "Booking deleted"
        render json: "Booking deleted."


      #   respond_to do |format|
      # render json: "Booking deleted."
      #
      #     end


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
