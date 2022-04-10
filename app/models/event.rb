class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations, dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee

  scope :future, -> { where("date >= ?", Date.today).order(date: :asc) }
  scope :past, -> { where("date < ?", Date.today).order(date: :desc) }

end
