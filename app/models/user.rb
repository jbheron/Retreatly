class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable#, :validatable

  has_many :events_participants, foreign_key: :participant_id
  has_many :events, through: :events_participants

  has_many :hosted_events, class_name: "Event", foreign_key: :host_id

  has_many :venues
end