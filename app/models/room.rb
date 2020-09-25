# frozen_string_literal: true

class Room < ApplicationRecord
  # Write your code here
  has_many :bookings, dependent: :destroy


end
