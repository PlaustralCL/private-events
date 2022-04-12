class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :invitations, dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee

  validates :title, presence: true
  validates :location, presence: true
  validates :date, presence: true

  scope :future, -> { where("date >= ?", Date.today).order(date: :asc) }
  scope :past, -> { where("date < ?", Date.today).order(date: :desc) }


end
