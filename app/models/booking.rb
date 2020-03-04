# frozen_string_literal: true

class Booking < ApplicationRecord
  has_many :participants
  belongs_to :user
  belongs_to :room

  # Write your code here
end
