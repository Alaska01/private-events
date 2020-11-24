class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id'
  has_many :invitations, foreign_key: :attendee
  has_many :attended_events, through: :invitations, source: :attended_event

  validates_presence_of :name
end
