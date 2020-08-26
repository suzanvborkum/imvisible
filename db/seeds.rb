require 'open-uri'
require 'json'
require 'faker'

Protest.destroy_all
ProtestAssault.destroy_all
AssaultCategory.destroy_all
Station.destroy_all

assault_categories = %w(verbal touching following photos catcalling rape)
assault_categories.each do |category|
  AssaultCategory.create!(name: category)
end

url = "https://datos.cdmx.gob.mx/api/records/1.0/search/?dataset=estaciones-del-metro&q=&rows=10"
JSON.parse(open(url).read)["records"].each do |station|
  name = station["fields"]["name"]
  longitude = station["fields"]["lon"]
  latitude = station["fields"]["lat"]
  Station.create!(name: name, longitude: longitude, latitude: latitude)
end

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: 'test',
  station: Station.order('RANDOM()').first
  )
