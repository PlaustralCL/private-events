class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id"
  has_many :invitations, foreign_key: "attendee"
  has_many :attended_events, through: :invitations, source: :event

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
