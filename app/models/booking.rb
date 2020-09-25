# frozen_string_literal: true

class Booking < ApplicationRecord #::Base
  has_many :participants, dependent: :destroy
  belongs_to :user
  belongs_to :room

  validates :start_time, :end_time, :overlap => {:scope => [:room_id, :date]}
  validates_presence_of :date, :start_time, :end_time

end
