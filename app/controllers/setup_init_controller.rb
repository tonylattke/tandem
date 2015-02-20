class SetupInitController < ApplicationController

	def index
		# Load Countries
		
		# format time zone UTC
		
		# format address representation
		# s : street
		# n : number
		# z : zip code
		# p : place

		# http://userpage.chemie.fu-berlin.de/diverse/doc/ISO_3166.html
		# http://en.wikipedia.org/wiki/List_of_time_zones_by_country
		countries = [
			{
			'name' 		=> 'Germany',
			'time_zone'	=> '+01:00',
			'address_representation' => 's:n:.:z:p',
			'code' => 49,
			'iso_code' => 'de'
			},
			{
			'name' 		=> 'Venezuela',
			'time_zone'	=> '-04:30',
			'address_representation' => 's:n:.:p',
			'code' => 58,
			'iso_code' => 've'
			},
		]

		for country in countries
			country = Country.new(
				{
					:name => country['name'],
					:time_zone => country['time_zone'],
					:address_representation => country['address_representation'],
					:code => country['code'],
					:iso_code => country['iso_code']
				})
			#country.save
		end

		
	end

end
