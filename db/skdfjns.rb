require 'faker'
require 'date'

firstnames = %w(Daniel Noel Kathryn Elena Dharma Tim Karen Andre Kino Jai)

10.times do
	name = firstnames.shift
	User.create(first_name: name, last_name: Faker::Name.last_name, email: "#{name}@gmail.com", password: 'password')
end

User.all.each do |user|
	venues = %w('Marriott', 'Ritz Carlton', 'DBC', 'Motel 6', 'LaQuinta Inn')
	5.times do
		city = Faker::Address.city
		startdate = Date.today()+rand(100)
		enddate = startdate + rand(10)
		event = Event.create(title: "Yoga retreat in #{city}", description: Faker::Company.catch_phrase, start_date: startdate, end_date: enddate, price: rand(1000..10000), host_id: user.id)
		venue = Venue.create(name: "#{venues.shift} #{city}", country: Faker::Address.country, city: city, address: Faker::Address.street_address, lodging: Faker::Lorem.paragraph(2), travel: Faker::Lorem.paragraph(2), user_id: user.id, event_id: event.id)
	end
end

Event.all.each do |event|
	event.participants << User.all.sample(5)
	event.save
end