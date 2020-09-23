# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password


  # write your code here

  has_many :bookings, dependent: :destroy
  validates_presence_of :name, :email, :password, :password_digest


  validates :email,
  format: { with: /^[A-Za-z0-9+_.-]+@evil-corp\.com\z/, message: "- Email invalid, must be an 1) evil-corp.com email address, 2)special characters ($%# etc) arent allowed in your address", :multiline => true   },
           uniqueness: { case_sensitive: false },
           length: { minimum: 4, maximum: 254 }





end
