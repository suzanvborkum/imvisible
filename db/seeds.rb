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

url = "https://datos.cdmx.gob.mx/api/records/1.0/search/?dataset=estaciones-del-metro&q=&rows=40"
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

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "A man in his 40s, probably homeless, followed be around the station. He was making sexual noises. I was so shocked, it was the middle of the day!",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "It was a busy morning on the metro and my cabin was packed. All of a sudden I felt a hand stroke my leg. At first I thought it was accidental, but then he moved up my skirt. I tried to move a few meters away. I have a suspicion who did it, but I was never able to verify.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "A horrible thing happened to me on the metro today. A man started shouted disgusting things to me out of the blue. Like I was a whore and I dressed like a slut and that I was asking for men to rape me. What was even worse is that all the bystanders were laughing. I felt so humiliated.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "Every day I see girls being harassed while traveling on the metro. I’m so sick of it. This has to stop.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "My husband got into a big fight with a guy at our metro station because the man started catcalling me. I was so relieved I was with someone, otherwise I wouldn’t have know what to do.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "It was a Friday night and I was ready to go out with my friend. She was walking on front of me and got through the ticket gate, when this man started pressing himself against me from behind. I got overwhelmed and couldn’t find my ticket anymore. My friend was not able to do anything because she was already inside. After a minute I was able to pull myself loose and to enter. We ran off and jumped on the first available metro which was in the wrong direction, but we didn’t care.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "This happened already a week ago, but I still like to protest. I saw this girl, very drunk waiting for her metro, when these two guys came up to her. First it looked like some innocent flirting, but it got more aggressive. She didn’t want to talk to them but she was too drunk to properly defend herself. Then I saw the guys taking her outside of the station. I was on the other side of track but I alerted the police right away. I so wish that she is ok and nothing bad happened to her.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "The one time I get into an almost empty wagon I find a guy touching himself . There was a mom with kids in the wagon, and I tell the guy to stop being a creep and he yells back at me to shut up unless I want in on it. I got out in the next stop and so did the family.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "This man groped me on the metro. It was packed and he ripped up my button shirt. I started screaming but nobody helped me and I couldn’t get away because we were jammed together, I fought him however I could and got out on the next stop with my ripped clothes.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "As soon as I got to the station these two guys whistled at me trying to get my attention and I turned my back on them, but they started calling me names and insulted me. One got up and asked me where I was going but luckily this woman stood in the middle and he backed away, but not without telling me I wanted him.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I was on the metro with my little sister and she was acting weird, telling me she was scared but she wouldn’t tell me why, so I started looking around and this creep was making her feel uncomfortable. I stared at him as if telling him I was watching him but he defied me. We got out on the next stop and luckily he didn’t follow us but I got really scared for both of us.",
    station: Station.order('RANDOM()').first
    )
end

5.times do
  Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "I witnessed a girl getting groped by 3 men in the station. It was late and I had just gotten there and heard the airl say: “please stop.” So I told them to please stop it, but then one of them turn to me and he had his thing out, so I ran away as far as I could Trying to find someone. I found someone that would go back with me but when we got there, they weren’t there anymore. I cannot get the image or the voice of the girl out of my head.",
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

