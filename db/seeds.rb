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

url = "https://datos.cdmx.gob.mx/api/records/1.0/search/?dataset=estaciones-del-metro&q=&rows=30"
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
    description: "I rode the metro back home and was happy to see it was very busy, because I always feel more safe. But this man in his 40s started glaring at me intensely. I tried to focus on my book until he sat next to me. My heart was racing and I decided to jump off at the following station to take the next metro.",
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

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "These two men in their 50s started talking to me while I was waiting for the metro. I told them that I was not interested in talking, but they kept pushing. I decided the best way was to maybe just make some small talk and they would go away, but that gave them the wrong impression. The following me into the metro and sat next to me. The whole time I kept wondering how to get out of this situation. Luckily they didn’t follow me out of the metro, but the experience was very intrusive.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "It was late at night when I was coming home from a drink when I sat in a nearly empty metro. I had few drinks so I was not paying a lot of attention, but suddenly I noticed that the man a few seats from me was watching me and masturbating. I was so shocked that I could not move for a minute. I asked the nearest person if he could accompany to another part of the metro. He was very sweet, but the incident creeped me out so much.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "Every morning there is a man sitting near the entrance of my station that throws verbal attacks at me. I’m so sick of it and every morning I have to find the courage to go to work, but I refuse to go to another station.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I wanted to make a protest about all the things that happened to me in the last years. I think norms of public transport are such that it makes us captive victims unable to speak out. I am happy this platform exists.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I was followed by 2 guys who started taking pictures of me in the metro and got out with me in the same station. Thankfully it was very crowded and I lost them.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "This asshole in a suit grabbed me really hard before stepping out of the metro. I was standing near the door and when he passed by me grabbed me from the back, I let out a scream and when I turned around he was already outside of the train. I started telling him off and he just stared at me like nothing and nobody said anything.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I was waiting for the bus when this guy came up very close to my face and asked me for money. There was a woman standing close to us and I locked eyes with her. The guy kept there waiting for me to give him money. I got some coins out and gave them to him and he just stood there as if he was analyzing me. He smirked at me and left, but it was very scary he had one hand hidden the entire time.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I saw a guy walking behind this girl in the station and coming up to her to say something to her ear. He walked past her and moved on while the girl froze.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "A car slowed down next to me when I was close to the station and this guy was yelling disgusting things at me and telling me to come with him. As I got closer to the station the car fully stopped and this other guy from the back and was walking towards me so I ran into the station that was full of people and lost him.",
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

