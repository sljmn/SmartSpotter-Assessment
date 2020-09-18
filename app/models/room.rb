# frozen_string_literal: true

class Room < ApplicationRecord
  # Write your code here
  has_one :booking
end
