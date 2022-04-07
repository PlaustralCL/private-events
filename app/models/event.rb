class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations
  has_many :attendees, through: :invitations, source: :attendee

  def self.future
    where("date >= ?", Date.today).order(date: :asc)
  end

  def self.past
    where("date < ?", Date.today).order(date: :desc)
  end
end
