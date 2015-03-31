namespace :init do
  desc "Add languages to DB"
  task languages: :environment do
    languages = 
      [
        'German',
        'Spanish',
        'English',
      ]
    for language in languages
      aux = Language.new({:name => language})
      aux.save
    end
    puts 'Ready! Languages loaded'
  end

  desc "Add countries to DB"
  task countries: :environment do
    countries = 
      [
        {
          'name' => 'Venezuela',
          'time_zone' => '-04:30',
          'address_representation' => 's:n:.:z:r',
          'code' => 58,
          'iso_code' => 've'
        },
        {
          'name' => 'Spain',
          'time_zone' => '+00:00',
          'address_representation' => 's:n:.:z:r',
          'code' => 34,
          'iso_code' => 'es'
        },
        {
          'name' => 'Germany',
          'time_zone' => '+01:00',
          'address_representation' => 's:n:.:z:r',
          'code' => 49,
          'iso_code' => 'de'
        },
        {
          'name' => 'United States',
          'time_zone' => '-06:00',
          'address_representation' => 'n:s:.:r:z',
          'code' => 1,
          'iso_code' => 'us'
        },
      ]
    for country in countries
      aux = Country.new(
        {
          :name => country['name'],
          :time_zone => country['time_zone'],
          :address_representation => country['address_representation'],
          :code => country['code'],
          :iso_code => country['iso_code'],
        })
      aux.save
    end
    puts 'Ready! Countries loaded'
  end

  desc "Add languages to the countries to DB"
  task countries_languages: :environment do
    ####################################### Spanish #####################################
    spanish = Language.find_by(name: 'Spanish')
    
    venezuela = Country.find_by(name: 'Venezuela')
    venezuela_spanish = CountryLanguage.new({:country => venezuela, :language => spanish})
    venezuela_spanish.save

    spain = Country.find_by(name: 'Spain')
    spain_spanish = CountryLanguage.new({:country => spain, :language => spanish})
    spain_spanish.save

    ####################################### German ######################################
    german = Language.find_by(name: 'German')

    germany = Country.find_by(name: 'Germany')
    germany_german = CountryLanguage.new({:country => germany, :language => german})
    germany_german.save

    ####################################### English #####################################
    english = Language.find_by(name: 'English')

    usa = Country.find_by(name: 'United States')
    usa_english = CountryLanguage.new({:country => usa, :language => english})
    usa_english.save

    puts 'Ready! languages added to countries'
  end

end
