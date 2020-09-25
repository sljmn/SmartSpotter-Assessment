# frozen_string_literal: true

module Api
  module V1
    class RoomsController < ApplicationController
      # you can find these includes in controllers/concerns
      include Response
      include ExceptionHandler

      def index
        rooms = Room.all
        json_response(rooms)
      end

      def show
        # Write your code here
        room = Room.find(params[:id])
        render json: room
      end

      def create
        # Write your code here
        @room = Room.new
        respond_to do |format|
        format.json do
            if @room.from_json(params[:room]).save
               #render room
            else
               #render errors
            end
        end
        format.xml do
            if @room.from_xml(params[:room]).save
            else
            end
        end
    end

      end

      def update
        # Write your code here
        @room = Room.find(params[:id])
        puts @room.inspect

        # puts "******"
        # puts @booking.inspect
        # puts "******"
        # puts current_user.id

          if @room.update(rooms_params)
        #
           render json: @room, status: :ok

           else
        render json: @room.errors, status: :unprocessable_entity 

             end


      end

      def destroy
        # Write your code here
      end

      private

      def rooms_params
        params.permit(:name)
        # Write your code here
      end
    end
  end
end
