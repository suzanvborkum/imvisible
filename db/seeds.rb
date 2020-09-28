require 'open-uri'
require 'json'
require 'faker'

Protest.destroy_all
ProtestAssault.destroy_all
AssaultCategory.destroy_all
Station.destroy_all

assault_categories = ["verbal", "me siguieron", "toqueteo", "fotos", "piropos", "violación"]
assault_categories.each do |category|
  AssaultCategory.create!(name: category)
end

url = "https://datos.cdmx.gob.mx/api/records/1.0/search/?dataset=estaciones-del-metro&q=&rows=194"
JSON.parse(open(url).read)["records"].each do |station|
  name = station["fields"]["name"]
  longitude = station["fields"]["lon"]
  latitude = station["fields"]["lat"]
  Station.create(name: name, longitude: longitude, latitude: latitude)
end

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "I rode the metro back home and was happy to see it was very busy, because I always feel more safe. But this man in his 40s started glaring at me intensely. I tried to focus on my book until he sat next to me. My heart was racing and I decided to jump off at the following station to take the next metro.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Three young men were calling me a slut and a whore when I was waiting for my metro. I was too intimidated to respond and was afraid they would start to follow me. I looked for help around from security, but there was no one to help me. I decided to leave the station and take an Uber home.",
  station: Station.order('RANDOM()').first
  )


Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "I was riding metro line 3 and sitting in the women’s wagon when this drunk dude came in that started throwing his food at me and my friend. We tried to tell him he shouldn’t even be in this wagon but he got very aggressive. We left the metro at the next station and decided to take the following one. I can’t believe this still happens every day in my city.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
    experienced: true,
    date: Faker::Date.between(from: 30.days.ago, to: Date.today),
    time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    description: "It was a busy morning on the metro and my cabin was packed. All of a sudden I felt a hand stroke my leg. At first I thought it was accidental, but then he moved up my skirt. I tried to move a few meters away. I have a suspicion who did it, but I was never able to verify.",
    station: Station.order('RANDOM()').first
    )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "A horrible thing happened to me on the metro today. A man started shouted disgusting things to me out of the blue. Like I was a whore and I dressed like a slut and that I was asking for men to rape me. What was even worse is that all the bystanders were laughing. I felt so humiliated.",
  station: Station.order('RANDOM()').first
  )



Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Apenas entré a la estación dos chicos empezaron a silbarme y tratar de agarrar mi atención. Yo me volteé para darles la espalda pero empezaron a gritar e insultarme. Uno de los chicos vino hacía a mí a preguntarme para donde iba, yo le dije que a él que le importaba y se río de mí. Acercándose más me seguía preguntando para dónde iba que me fuera con él, pero por suerte una señora interrumpió pidiendo permiso y el chico se fue.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Estaba en el metro con mi hermana pequeña y ella estaba actuando un poco raro, la sentía muy incomoda y me decía que estaba asustada pero no me decía porque. Entonces vi a este señor que era el que estaba poniéndola incomoda mirándola.  Yo le dije que cuál era su problema? Y el señor se levantó desafiante, pero el metro llegó a una parada en ese momento y salimos corriendo. El señor se quedó en el metro.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Vi a una chica en la estación siendo manoseada y agarrada por 3 hombres. Era un poco tarde y yo apenas había llegado y cuando me vió empezó a gritar: paren, por favor paren! Y les grite que pararan, pero uno de los hombres se volteó hacía mí y tenía su pene afuera. Inmediatamente salí corriendo buscar a alguien que ayudara. Cuando finalmente encontré a dos policías, me dijeron que no había nadie. No puedo sacarme la voz de la chica pidiendo ayuda de mi cabeza.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Ya no sé que hacer con esta situación. He tenido muchas experiencias desagradables en el metro pero hoy tuve que vivi una donde habían niños. Era un poco tarde y venía el metro bastante vacío y me subí en un donde había una madre con sus dos hijas y las vi actuando raro. Cuando empezó a moverse el metro veo que al final hay un hombre y se estaba desabrochando el pantalón. Se sacó el pene y empezó a masturbarse. Yo le empecé a gritar diciéndole que era un asqueroso y pervertido y me gritó que me callara o que no iba a gustar lo que iba a hacer. Todos nos bajamos en la próxima parada aunque no era la que me tocaba por el asqueroso ese.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "No creo que pueda usar el metro pronto después de lo que me pasó… Hace una semana fui seguida y abusada sexualmente por un hombre desconocido. Era tarde en la noche y yo estaba regresando a casa de estudiar, la estación estaba desierta, y yo estaba caminando hacía la salida cuando este hombre se aparece en frente mío. Empecé a gritar y el me empuja contra una pared y empieza a tocarme por todas partes. Todavía puedo olerlo, olía horrible. Yo gritaba pero no había nadie cerca. El tipo creo que escuchó algo porque se descuido y pude soltarme y salir corriendo. Fui a reportarlo pero la policía dijo que no podía hacer nada por no tenía heridas visuales.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Esta mañana fui al trabajo y vi a esta mujer peleandoo con un hombre en la estación. Al comienzo no sabía si se conocián pero después cuando lo vi agarrarle el trasero a la mujer y ella gritándole supe que no era el caso. Todo se salió de control porque el hombre se enfureció ante el rechazo. Yo estaba muy asustada como para intervenir pero por suerte dos chicos intervinieron y el hombre salió huyendo. Pude hablar con ella después para calmarla un poco.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Mi mejor amiga fue horriblemente violentada y estoy haciendo esta protesta por ella. Fue violada afuera de la estación cuando venía tarde devuelta a casa del trabajo. Fue inmediatamente a la policía pero como no pudo describir bien al violador, su caso fue desechado. Tuvo que pasar casi 24 horas en la estación y en el hospital haciéndose las pruebas para que absolutamente nada pasara. Mi amiga esta herida y afectada y el desgraciado ese sigue suelta violando mujeres afuera de las estaciones del metro. Nadie hace nada, el gobierno no ayuda, No nos escuchan!",
  station: Station.order('RANDOM()').first
  )


Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Estos dos señores en sus 50s empezaron a hablarme mientras estaba esperando el metro. LEs dije que no estaba interesada en hablar per siguieron molestándome. Pensé que lo mejor sería seguirles la conversación pero terminaron subiendo al mismo metro que yo y continuaron hablándome. Yo estaba muy incomoda con ellos tan cerca mío y empujando para que siguiera hablándoles, pensando como me salgo de esto. Por suerte en la próxima estación me despedí y no se bajaron pero todo fue muy incomodo.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Era un viernes por la noche y estaba lista para salir con mi mejor amiga. Ella estaba caminando delante de mi y pasó primero por la baranda de los pases, cuando este hombre empezó a agarrarme por detrás. Me puse tan nerviosa que no encontraba mi pase. Mi amiga le empezó a gritar pero el parecía no escuchar nada y no me soltaba. Después de un minuto de forcejeo pude liberarme y pasé al área del metro. Salimos corriendo y nos montamos en el primer metro que vimos aunque no fuese nuestro destino.",
  station: Station.order('RANDOM()').first
  )

Protest.create!(
  experienced: true,
  date: Faker::Date.between(from: 30.days.ago, to: Date.today),
  time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  description: "Esto pasó hace una semana, pero igual quiero hacer esta protesta. Vi a esta chica que se veía un poco borracha, esperando el metro cuando 2 hombres se acercan a ella. Primero se veía como un coqueteo inocente pero se tornó algo agresivo. Ella no quería hablar con ellos, pero estaba muy borracha para poder defenderse y vi cómo estos dos hombres se la estaban llevando fuera de la estación. Yo estaba del otro lado del carril, pero pude advertir a unos policías rápidamente. Solo espero que esté bien y nada le haya pasado.",
  station: Station.order('RANDOM()').first
  )


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

