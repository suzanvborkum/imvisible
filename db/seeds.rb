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

url = "https://datos.cdmx.gob.mx/api/records/1.0/search/?dataset=estaciones-del-metro&q=&rows=50"
JSON.parse(open(url).read)["records"].each do |station|
  name = station["fields"]["name"]
  longitude = station["fields"]["lon"]
  latitude = station["fields"]["lat"]
  Station.create!(name: name, longitude: longitude, latitude: latitude)
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I was walking from line 1 to line 6 in the station when a man started to talk to me. I told him to go away, but he continued to follow me. At the platform I tried to avoid him, but he kept on shouting things to me. Luckily he did not get on the metro when I got on. I hate it that he didn’t just leave me alone.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "Three young men were calling me a slut and a whore when I was waiting for my metro. I was too intimidated to respond and was afraid they would start to follow me. I looked for help around from security, but there was no one to help me. I decided to leave the station and take an Uber home.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I had a really horrible incident yesterday. I’m used to men talking to me on the metro, but yesterday this man started to touch me and rub himself on me. I started beating him, but he wouldn’t stop. I ran off to be in a safe spot but felt so disgusted all day. I fear going back to that station because maybe he will be there again.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I was riding metro line 3 and sitting in the women’s wagon when this drunk dude came in that started throwing his food at me and my friend. We tried to tell him he shouldn’t even be in this wagon but he got very aggressive. We left the metro at the next station and decided to take the following one. I can’t believe this still happens every day in my city.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I don’t think I will ride the metro soon again after what happened to me a few days ago…. I was followed and sexually assaulted by a guy. It was late at night and the station was very deserted. I was walking to the exit when all of a sudden this man appeared in front of me. He pushed me against the wall and started to touch me everywhere. He smelled horribly. I screamed, but no one was around. After a minute or so I was able to pull myself loose and I ran away. I reported it to the police but they told me they couldn’t do anything.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I’m so sick and tired of men yelling things at me. Every day I get disrespectful comments thrown at me. I could be here every day protesting the verbal assaults. I refuse to stop riding the metro but it is really tiring and it needs to change.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "This morning I went to work and I saw this girl fighting with a man on the platform. At first I wasn’t sure if they knew each other but then I realized that he just touched her ass and she was putting him into place. The whole incident got out of hand because he got infuriated at her. I was too scared to intervene but luckily these two guys stepped in and pulled the man away. I talked to the girl a bit after to calm her down.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "My best friend was brutally harassed yesterday and I am making the protest for her because she is still too traumatized. She was raped just outside the station when she came home late at night from work. She immediately went to the police afterwards but because she couldn’t describe the predator well, the report was dismissed. My friend is badly hurt and this fucker is still walking around raping women at metro stations. The government does shit. I want to protest every day to get something done.",
    station: Station.order('RANDOM()').first
    )
end

Protest.all.each do |protest|
  categories = AssaultCategory.all
  rand(1..3).times do
    protest_assault = ProtestAssault.new
    protest_assault.assault_category = categories.sample
    protest_assault.protest = protest
    begin
      protest_assault.save!
    rescue
      next
    end
  end
end

