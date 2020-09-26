require 'rails_helper'

# RSpec.describe Room, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end


describe "get all the rooms route", :type => :request do
  let!(:room) {FactoryBot.create_list(:room, 1)}

  before {get '/api/v1/rooms'}
  it 'returns all rooms' do
    expect(JSON.parse(response.body).size).to eq(1)

  end




  it 'returns status code 200' do

      get '/api/v1/rooms'
      puts response.body

    expect(response.status).to have_http_status(:success)
  end
end
