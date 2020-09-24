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
        puts "index"

        if @booking.empty?
          render json: "There are no bookings in this room. Why not book one?"
        else
          render json: @booking

        end
      end


      def bookings

        bookings = Booking.all
        if bookings.empty?
          render json: "There are no bookings. Why not book one?"
        else
          render json: bookings
        end

      end




      def create

      @booking =  current_user.bookings.build(booking_params)





        if @booking.save
          render json: @booking, status: :created
          puts "booking saved! your booking is on #{@booking.date} from  #{@booking.start_time} until #{@booking.end_time}"
        #  puts @booking.inspect
        else
          render json: @booking.errors, status: :unprocessable_entity
          puts "something went wrong... this time slot isnt available, try another room/ date or timeslot!"



        end
      end



      def show
      #  @room = Room.find(params[:room_id])
        # booking = @room.bookings
        booking = Booking.find(params[:id])
         render json: booking

      end



      def update
        # Write your code here

        @booking = current_user.bookings.find(params[:id])

        puts "******"
        puts @booking.inspect
        puts "******"
        puts current_user.id
        respond_to do |format|
          if @booking.update(booking_params)

            format.json { render json: @booking, status: :ok  }
            puts "******************************"
            puts "your booking is updated!"
            puts "******************************"
          else

          format.json { render json: @booking.errors, status: :unprocessable_entity }
          puts "******************************"
          puts "you can only update your own bookings...."
          puts "******************************"
      end
    end




      end

      def destroy
        # Write your code here
        @booking = current_user.bookings.find(params[:id])
        puts @booking.inspect
        @booking.destroy
        puts "Booking deleted"
        render json: "Booking deleted."




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
