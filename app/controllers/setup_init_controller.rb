class SetupInitController < ApplicationController

	def index
		############################ Load Countries ###########################
		
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
			new_country = Country.new(
				{
					:name => country['name'],
					:time_zone => country['time_zone'],
					:address_representation => country['address_representation'],
					:code => country['code'],
					:iso_code => country['iso_code']
				})
			#new_country.save
		end

		############################ Load Languages ###########################
		
		languages = [
			{
				'name' 		=> 'german',
			},
			{
				'name' 		=> 'spanish',
			}
		]

		for language in languages
			new_language = Language.new(
				{
					:name => language['name']
				})
			#new_language.save
		end

		#################### Load Countries with Languages ####################
		
		c_l_s = [
			{
				'country' 	=> 'Germany',
				'language' 	=> 'german',
			},
			{
				'country' 	=> 'Venezuela',
				'language'	=> 'spanish',
			}
		]

		for c_l in c_l_s
			new_c_l = CountryLanguage.new(
				{
					:country => Country.find_by(name: c_l['country']),
					:language => Language.find_by(name: c_l['language'])
				})
			#new_c_l.save
		end

	end

end
