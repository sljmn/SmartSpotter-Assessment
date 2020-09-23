# frozen_string_literal: true

# Feel free to change whatever you like regarding the routes.
# This is just an example

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :rooms, except: %i[create destroy] do
        resources :bookings
      end

      resources :bookings, except: [:create, :index] do
        resources :participants, except: :update
      end
      resources :users
    end
  end



  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get '/api/v1/bookings', to: 'api/v1/bookings#bookings'
  post '/api/v1/bookings/:booking_id/participants', to: 'participants#create'
  post '/api/v1/rooms/:room_id/bookings', to: 'bookings#create'

end
