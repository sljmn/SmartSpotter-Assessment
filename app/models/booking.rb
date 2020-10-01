# frozen_string_literal: true

class Booking < ApplicationRecord #::Base
  has_many :participants, dependent: :destroy
  belongs_to :user
  belongs_to :room

  validates :start_time, :end_time, :overlap => {:scope => [:room_id, :date]}
  validates_presence_of :date, :start_time, :end_time

  #start_time mag niet later zijn dan end_time

  def self.check_time_slot?(params)
    puts params.inspect

    start_time = params[:start_time]
    end_time = params[:end_time]

    puts start_time
    puts end_time

    if start_time < end_time
      puts true
      return true
    elsif start_time == end_time
      puts false
      return false
    else
      puts false 
      return false
    end

  end

end
