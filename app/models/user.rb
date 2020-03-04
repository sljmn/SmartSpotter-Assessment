# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # write your code here

  has_many :bookings, dependent: :destroy
  validates_presence_of :name, :email, :password, :password_digest

  # write your code here
end
