class Event < ActiveRecord::Base
	belongs_to :user
	has_many :venues
	# belongs_to :location
end
