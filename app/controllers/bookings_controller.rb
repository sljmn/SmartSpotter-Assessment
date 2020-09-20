# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :authorize_request


  def create
    @booking = current_user.bookings.build(booking_params)
    puts @booking
    puts " from the normal controller"
  end

  private

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
