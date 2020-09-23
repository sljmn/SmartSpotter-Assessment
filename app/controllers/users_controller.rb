# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request, except: :create

  # POST /signup
  # return authenticated token upon signup
  def create
     
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    puts auth_token
    puts "auth_token"
    json_response(response, :created)
  end


  private

  def user_params
    params.require(
      :user
    ).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
