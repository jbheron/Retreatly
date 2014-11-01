class Venue < ActiveRecord::Base
	belongs_to :event
	belongs_to :user
	# belongs_to :location
end
