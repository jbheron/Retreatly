class Event < ActiveRecord::Base
	has_many :venues
	belongs_to :host, class_name: "User"
	has_many :events_participants
	has_many :participants, through: :events_participants

	# belongs_to :location
end
