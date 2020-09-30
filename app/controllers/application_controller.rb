# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authorize_request, only: :authenticate

  include Response
  include ExceptionHandler

  # called before every action on controllers
  before_action :authorize_request
  attr_reader :current_user

def index
  

end

  private


  # Check for valid request token and return user
  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end
end
