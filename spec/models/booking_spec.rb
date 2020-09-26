# frozen_string_literal: true


require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject {build(:booking)}

  it 'has a valid factory' do
    expect(subject).to be_valid
  end
  describe 'ActiveModel validations' do
    it {  expect(subject).to validate_presence_of(:date) }
    it {  expect(subject).to validate_presence_of(:start_time) }
      it {  expect(subject).to validate_presence_of(:end_time) }
  end
end
