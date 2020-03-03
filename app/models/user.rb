# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # write your code here

  has_many 
  validates_presence_of

  # write your code here
end
