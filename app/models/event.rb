class Event < ApplicationRecord
  has_many :invitations, foreign_key: :attended_event_id
  has_many :attendees, through: :invitations, source: :attendee
  belongs_to :creator, class_name: 'User'

  scope :past, -> { where(['date < ?', Date.today]) }
  scope :future, -> { where(['date > ?', Date.today]) }

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :location
  validates_presence_of :date
  validates_presence_of :creator_id
end
