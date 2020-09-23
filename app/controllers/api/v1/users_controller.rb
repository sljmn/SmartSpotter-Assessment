# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authorize_request, only: :create

      # you can find these includes in controllers/concers
      include Response
      include ExceptionHandler

      def create
        user = User.create!(user_params)

        auth_token = AuthenticateUser.new(user.email, user.password).call
        response = { message: Message.account_created, auth_token: auth_token }
        puts auth_token
        puts "auth_token"
        json_response(response, :created)

        if user.valid?
        
          token = encode_token({user_id: user.id})
          render json: {user: user, auth_token: auth_token}
        else
          render json: {error: "Invalid username or password"}
        end
      end

      # LOGGING IN
        def login
          @user = User.find_by(email: params[:email])

          if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})
            render json: {user: @user, token: token}
          else
            render json: {error: "Invalid username or password"}
          end
        end
      # Write your code here

      # Check if email adres is @evilcorp


      def auto_login
        render json: @user
      end



      private

      def user_params
        params.permit(
          :name,
          :email,
          :password,
          :password_confirmation
        )
      end

      # Write your code here
    end
  end
end
