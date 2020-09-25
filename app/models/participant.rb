# frozen_string_literal: true

class Participant < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  belongs_to :invitee, class_name: 'User', foreign_key: 'invitee_id'

   validates :booking, :uniqueness => {:scope=>:invitee} #only invite 1 user for 1 room


end
