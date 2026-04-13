SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Answer;
TRUNCATE TABLE Question;
TRUNCATE TABLE City;
SET FOREIGN_KEY_CHECKS = 1;

-- ============================================================
-- CITIES
-- ============================================================

INSERT INTO City (cityName, historyText, factsText, cityBanner) VALUES
('Mexico City',
 'Mexico City was founded by the Aztecs as Tenochtitlán in 1325 on an island in Lake Texcoco. Spanish conquistador Hernán Cortés conquered the city in 1521 and built the colonial capital directly over the Aztec ruins. It became the seat of the Viceroyalty of New Spain and, after independence in 1821, was established as the national capital by the republican constitution of 1824. The city hosted the Summer Olympic Games in 1968 and has grown into one of the largest metropolitan areas in the world.',
 'Mexico City is home to over 20 million people, making it the second-largest metropolitan area in the Americas. It contributes 25.3% of Mexico\'s national GDP through its service sector. The Alameda Central is recognized as the oldest public park in the Americas. The city is built on soft soil over a drained lakebed, which amplifies the effects of earthquakes caused by the Cocos tectonic plate.',
 'MexicoCityBanner.jpg'),

('Buenos Aires',
 'Buenos Aires was first settled by Spanish colonizer Pedro de Mendoza in 1536 and named Nuestra Señora Santa María del Buen Aire. After the original settlement failed, Juan de Garay permanently refounded the city in 1580. It became the seat of the Viceroyalty of the Río de la Plata in 1776 and was officially made the federal capital of Argentina in 1880 after years of political conflict between the city and the interior provinces.',
 'Buenos Aires is the largest port in South America and home to the University of Buenos Aires, Argentina\'s major national university. Its residents are known as porteños, meaning people of the port. The tango dance was born in Buenos Aires in the late 1800s. Greater Buenos Aires is home to about one-third of all Argentine people.',
 'BuenosAiresBanner.jpg'),

('Barcelona',
 'Barcelona was traditionally founded by the Phoenicians or Carthaginians, who had trading posts along the Catalonian coast. During Roman times it was known as Barcino. The city became an important religious centre before the Moorish arrival in 717 CE. Philip V of Spain besieged and captured Barcelona in 1714 after Catalans supported a rival claimant, dismantling local self-government. The city served as the loyalist capital during the Spanish Civil War in 1937–39 and hosted the Summer Olympic Games in 1992.',
 'Barcelona is the capital of the Catalonia autonomous community and Spain\'s major Mediterranean port. The Barcelona area provides about one-fifth of Spain\'s industrial output. The Sagrada Família basilica, designed by Antoni Gaudí, has been under construction since 1882. FC Barcelona\'s youth academy La Masia has produced world-class players including Lionel Messi, Xavi, and Andrés Iniesta.',
 'BarcelonaBanner.jpg'),

('Bogotá',
 'European settlement in Bogotá began in 1538 when Gonzalo Jiménez de Quesada conquered Bacatá, the main seat of the indigenous Chibcha people. The Spanish named the city Bogotá and made it the capital of New Granada. After Simón Bolívar led Colombia to independence in 1819, Bogotá became the capital of the Republic of Colombia. The city is laid out in a grid pattern with Plaza de Bolívar at its historic center.',
 'Bogotá sits 2,640 meters above sea level in the Cordillera Oriental of the Northern Andes, making it one of the highest capital cities in the world. It is home to the Gold Museum, which possesses the world\'s finest and largest collection of worked gold. Avianca, the first commercial airline in South America, is headquartered in Bogotá. The city is widely nicknamed the Athens of South America for its universities and cultural institutions.',
 'BogotáBanner.jpg'),

('Lima',
 'Lima was founded by Spanish conquistador Francisco Pizarro on January 18, 1535, originally named Ciudad de los Reyes. It quickly became the capital of the Viceroyalty of Peru and the center of Spanish power across South America. A powerful earthquake devastated the city in 1746, killing 5,000 people, though it was later rebuilt. Peru became the last mainland Spanish colony to declare independence in July 1821, with Lima remaining its capital.',
 'Lima is home to the National University of San Marcos, the oldest university in South America, chartered in 1551. The city\'s historic center was designated a UNESCO World Heritage site in 1988. Lima accounts for about one-quarter of Peru\'s total population and is nicknamed El Pulpo (The Octopus) for its dominant role in the country. The city sits on the south bank of the Rímac River, whose Quechua name means Talker.',
 'LimaBanner.jpg'),

('Cartagena',
 'Cartagena de Indias was founded by the Spaniard Pedro de Heredia in 1533 on the northern Caribbean coast of Colombia. It became one of the major naval and merchant marine bases of the Spanish empire and held a monopoly on the slave trade to Spanish South America, with approximately 120,000 enslaved Africans arriving between the 16th and 18th centuries. The province declared independence from Spain in 1811. The opening of petroleum fields in the Magdalena River valley after 1917 revitalized the city\'s economy.',
 'Cartagena is the capital of Bolívar department in northern Colombia. The 17th-century fortress of San Felipe de Barajas is one of its most iconic landmarks. Nearby San Basilio de Palenque, founded by escaped enslaved Africans, was granted freedom by the Spanish Crown in 1691, making it one of the first free African towns in the Americas. Its residents speak Palenquero, a Spanish-based creole language that is unique to the community.',
 'CartagenaBanner.jpg'),

('Valladolid',
 'The first recorded mention of Valladolid appears in a letter of 1074, when it was referred to as a Moorish city called Belad Ulid. From the reign of Alfonso VII onward it served as the seat of the Castilian and Spanish royal court. Isabella of Castile and Ferdinand of Aragon were married in Valladolid in 1469, uniting the Spanish kingdoms. King Philip II was born in the city on May 21, 1527. Christopher Columbus died in Valladolid on May 20, 1506.',
 'Valladolid is the capital of the autonomous community of Castile-León in northwestern Spain. Its university, founded in 1346 and recognized by Pope Clement VI, is one of the oldest in Spain. The 15th-century collegiate church of San Gregorio, with its magnificent late Gothic facade, now houses a famous museum of wood sculpture. Northern Valladolid province is known as the granary of Spain for its production of barley, oats, and beets.',
 'ValladolidBanner.jpg'),

('Potosí',
 'Potosí was established in 1545 on the slopes of Cerro Rico (Rich Mountain) in present-day Bolivia, after the Spaniards discovered the richest silver deposits in the Western world. By the mid-17th century its population reached approximately 150,000, making it the largest city in the Americas and comparable in size to the largest European cities of the era. Indigenous workers were forced to labor in the mines through the mita system of conscripted labor. Between 1803 and 1825 silver production declined by more than 80 percent due to the wars of independence.',
 'Potosí sits at an elevation of 4,050 meters (13,290 feet), making it one of the highest cities in the world. UNESCO designated it a World Heritage site in 1987. The Casa de la Moneda, a colonial mint built in the 1570s, now houses a museum of local history, mining machinery, and ethnography. The name Potosí is derived from the Quechua word potojchi, meaning deafening noise, while Cerro Rico translates to Rich Mountain.',
 'PotosíBanner.jpg'),

('Mérida',
 'In 1542 Spanish conquistador Francisco de Montejo founded Mérida on the site of the ancient Maya city T\'ho (Tihoo), making it an early base for Spanish efforts to conquer the Maya. In the 19th century its economy was driven by henequen, a fibrous plant used to produce twine and rope, which made Mérida one of Mexico\'s most important commercial cities by the early 20th century. The henequen trade declined precipitously after World War II. Many former plantations now grow citrus fruits.',
 'Mérida is the capital of the state of Yucatán in southeastern Mexico and lies about 20 miles south of its Gulf of Mexico port, Progreso. The city is a gateway to major Mayan archaeological sites including Chichén Itzá, Uxmal, and Kabah. The Casa de Montejo, built in 1549, and the cathedral, begun in 1561, are among its notable colonial-era buildings. The Regional Museum of Anthropology, opened in 1920, exhibits Olmec and Mayan artifacts.',
 'MéridaBanner.jpg'),

('Asunción',
 'Asunción was founded on August 15, 1537, named after the Feast of the Assumption on the day its founding stockade was completed. It served as the headquarters of Spanish colonial activities in eastern South America for nearly half a century before Buenos Aires was refounded. In 1588 the Jesuits established mission settlements on the Paraná River to convert the Guaraní population. Paraguay declared independence from Spain in Asunción on May 14–15, 1811. General Alfredo Stroessner seized power in 1954 and ruled as a dictator until 1989.',
 'Asunción is the capital and largest city of Paraguay, sitting on the Paraguay River near its confluence with the Pilcomayo. Its Pantheon of Heroes is modeled after Les Invalides in Paris. The Universidad Nacional de Asunción, founded in 1890, is the largest national university of Paraguay. Paraguay fought the devastating War of the Triple Alliance (1864–1870) against Argentina, Brazil, and Uruguay. Guaraní is an official language of Paraguay alongside Spanish.',
 'AsunciónBanner.jpg');

-- ============================================================
-- QUESTIONS
-- cityId 1 = Mexico City   | cityId 6  = Cartagena
-- cityId 2 = Buenos Aires  | cityId 7  = Valladolid
-- cityId 3 = Barcelona     | cityId 8  = Potosí
-- cityId 4 = Bogotá        | cityId 9  = Mérida
-- cityId 5 = Lima          | cityId 10 = Asunción
-- ============================================================

INSERT INTO Question (cityId, questionText) VALUES
-- Mexico City (cityId = 1)
(1, 'What was Mexico City originally called by the Aztecs who founded it in 1325?'),
(1, 'On what body of water was the Aztec city of Tenochtitlán built?'),
(1, 'Which Spanish conquistador conquered Tenochtitlán in 1521?'),
(1, 'What 1824 document officially established Mexico City as the national capital?'),
(1, 'What major international sporting event did Mexico City host in 1968?'),
(1, 'Which iconic public park in Mexico City is the oldest public park in the Americas?'),
(1, 'Which tectonic plate slides beneath the North American plate near Mexico City?'),
(1, 'Which famous muralist\'s works are displayed inside the Palacio Nacional?'),
(1, 'What is the approximate population of the Mexico City metropolitan area?'),
(1, 'What percentage of Mexico\'s national GDP does Mexico City contribute through its service sector?'),

-- Buenos Aires (cityId = 2)
(2, 'What does the name Buenos Aires translate to in English?'),
(2, 'Who founded the first settlement at Buenos Aires in 1536?'),
(2, 'In what year was Buenos Aires permanently refounded by Juan de Garay?'),
(2, 'Buenos Aires became the seat of which Spanish colonial authority in 1776?'),
(2, 'What famous dance originated in Buenos Aires in the late 1800s?'),
(2, 'What nickname is given to the residents of Buenos Aires?'),
(2, 'What is the port of Buenos Aires considered to be within South America?'),
(2, 'Which is the major national university located in Buenos Aires?'),
(2, 'In what year was Buenos Aires officially made the federal capital of Argentina?'),
(2, 'What political movement associated with Juan Perón gained strong support among Buenos Aires migrants?'),

-- Barcelona (cityId = 3)
(3, 'According to tradition, which ancient civilization founded Barcelona?'),
(3, 'In what year did Barcelona host the Summer Olympic Games?'),
(3, 'What is the name of the famous unfinished church designed by Antoni Gaudí?'),
(3, 'Barcelona is the capital of which Spanish autonomous community?'),
(3, 'What is the name of FC Barcelona\'s famous youth academy?'),
(3, 'Approximately what share of Spain\'s industrial output does the Barcelona area provide?'),
(3, 'Which king besieged and captured Barcelona in 1714?'),
(3, 'What is the name of Barcelona\'s iconic tree-lined pedestrian mall?'),
(3, 'What role did Barcelona play during the Spanish Civil War from 1936 to 1939?'),
(3, 'What is the name of the rivalry match between FC Barcelona and Real Madrid?'),

-- Bogotá (cityId = 4)
(4, 'What was the original indigenous name for the area where Bogotá now stands?'),
(4, 'In what year did European settlement begin in Bogotá?'),
(4, 'At what altitude does Bogotá sit above sea level?'),
(4, 'What is the name of the main historic central square in Bogotá?'),
(4, 'Which museum in Bogotá holds the world\'s finest collection of worked gold?'),
(4, 'Which airline headquartered in Bogotá was the first commercial airline in South America?'),
(4, 'Whose military campaigns led Colombia to independence in 1819?'),
(4, 'What nickname is commonly used for Bogotá due to its universities and cultural institutions?'),
(4, 'Colombia is the most populous nation in which geographic group?'),
(4, 'Colombian artist Fernando Botero is internationally known for what style of art?'),

-- Lima (cityId = 5)
(5, 'Lima\'s name is a corruption of which Quechua word meaning Talker?'),
(5, 'Who founded Lima on January 18, 1535?'),
(5, 'What distinction does the National University of San Marcos in Lima hold?'),
(5, 'In what year was Lima\'s historic center designated a UNESCO World Heritage site?'),
(5, 'What major disaster nearly destroyed Lima in 1746?'),
(5, 'Why did the Spanish choose Lima\'s coastal location over the Inca capital of Cuzco?'),
(5, 'In what year did Peru become the last mainland Spanish colony to declare independence?'),
(5, 'What popular nickname does Lima have that reflects its dominant role in Peru?'),
(5, 'Approximately what fraction of Peru\'s total population lives in metropolitan Lima?'),
(5, 'What style heavily influenced the rebuilding of Lima after 1746?'),

-- Cartagena (cityId = 6)
(6, 'In what year was Cartagena de Indias founded by Pedro de Heredia?'),
(6, 'What is the name of the famous 17th-century fortress in Cartagena?'),
(6, 'What trade did Cartagena hold a monopoly over for Spanish South America?'),
(6, 'What economic development after 1917 revitalized Cartagena?'),
(6, 'In what year did Cartagena declare its independence from Spain?'),
(6, 'What nearby community was granted freedom by the Spanish Crown in 1691 as one of the first free African towns in the Americas?'),
(6, 'Who founded Cartagena de Indias?'),
(6, 'In what century did Cartagena lose economic preeminence to Barranquilla?'),
(6, 'Cartagena is the capital of which Colombian department?'),
(6, 'The Palenquero language spoken near Cartagena is based on which European language?'),

-- Valladolid (cityId = 7)
(7, 'Which two Spanish monarchs were married in Valladolid in 1469?'),
(7, 'Which famous explorer died in Valladolid on May 20, 1506?'),
(7, 'In what year was the University of Valladolid founded?'),
(7, 'Valladolid is the capital of which Spanish autonomous community?'),
(7, 'What is the name of the 15th-century collegiate church in Valladolid that now houses a wood sculpture museum?'),
(7, 'From which reign did Valladolid serve as the seat of the Spanish royal court?'),
(7, 'Which famous Spanish king was born in Valladolid on May 21, 1527?'),
(7, 'Which major modern industry anchors Valladolid\'s economy today?'),
(7, 'What is northern Valladolid province historically known as for its agricultural role?'),
(7, 'In what year does the first recorded mention of Valladolid appear?'),

-- Potosí (cityId = 8)
(8, 'In what year was Potosí established on the slopes of Cerro Rico?'),
(8, 'What was Potosí\'s approximate population at its mid-17th-century peak?'),
(8, 'At what approximate elevation does Potosí sit?'),
(8, 'In what year was Potosí designated a UNESCO World Heritage site?'),
(8, 'What is the name of the historic colonial mint in Potosí that now houses a museum?'),
(8, 'What does Cerro Rico translate to in English?'),
(8, 'By approximately how much did silver production at Potosí decline between 1803 and 1825?'),
(8, 'What system of conscripted Indigenous labor was used to work the Potosí silver mines?'),
(8, 'Potosí\'s silver mines greatly enriched which empire?'),
(8, 'The Church of San Lorenzo in Potosí is notable for which architectural style on its facade?'),

-- Mérida (cityId = 9)
(9, 'In what year did Francisco de Montejo found Mérida on the site of the ancient Maya city T\'ho?'),
(9, 'What fibrous plant drove Mérida\'s economy throughout the 19th and early 20th centuries?'),
(9, 'Mérida serves as the capital of which Mexican state?'),
(9, 'Which world-famous Mayan archaeological site is accessible on day trips from Mérida?'),
(9, 'When was the Autonomous University of Yucatán in Mérida founded?'),
(9, 'What happened to the henequen trade after World War II?'),
(9, 'In what year was the Casa de Montejo in Mérida built?'),
(9, 'What type of crops now grow on many former henequen plantations around Mérida?'),
(9, 'What two pre-Columbian civilizations are represented in Mérida\'s Regional Museum of Anthropology?'),
(9, 'How far south of its Gulf of Mexico port Progreso does Mérida lie?'),

-- Asunción (cityId = 10)
(10, 'After which religious feast day was Asunción named?'),
(10, 'Before which city assumed the role, Asunción was the most important Spanish colonial city in eastern South America?'),
(10, 'In what year did Paraguay declare independence from Spain?'),
(10, 'Which famous Parisian landmark is the Pantheon of Heroes in Asunción modeled after?'),
(10, 'Which religious order established mission settlements on the Paraná River near Asunción in 1588?'),
(10, 'Where does Asunción sit on the Paraguay River?'),
(10, 'What is Paraguay\'s official language alongside Spanish?'),
(10, 'In what year did General Alfredo Stroessner seize power in Paraguay?'),
(10, 'Which is the largest national university in Asunción, founded in 1890?'),
(10, 'Paraguay fought the War of the Triple Alliance against which three countries?');

-- ============================================================
-- ANSWERS (4 per question)
-- ============================================================

INSERT INTO Answer (questionId, answerText, isCorrect) VALUES
-- Mexico City Q1–Q10 
-- Q1
(1,  'Tenochtitlán',          true),
(1,  'Teotihuacán',           false),
(1,  'Tlatelolco',            false),
(1,  'Texcoco',               false),
-- Q2
(2,  'Lake Texcoco',          true),
(2,  'Lake Xochimilco',       false),
(2,  'Lake Chapala',          false),
(2,  'Lake Pátzcuaro',        false),
-- Q3
(3,  'Hernán Cortés',         true),
(3,  'Francisco Pizarro',     false),
(3,  'Diego de Almagro',      false),
(3,  'Vasco Núñez de Balboa', false),
-- Q4
(4,  'The republican constitution of 1824', true),
(4,  'The Treaty of Guadalupe',             false),
(4,  'The Plan de Iguala',                  false),
(4,  'The Ley Juárez',                      false),
-- Q5
(5,  'Summer Olympic Games', true),
(5,  'FIFA World Cup',       false),
(5,  'Pan American Games',   false),
(5,  'Copa América',         false),
-- Q6
(6,  'Alameda Central',  true),
(6,  'Chapultepec',      false),
(6,  'Parque México',    false),
(6,  'Parque España',    false),
-- Q7
(7,  'Cocos Plate',      true),
(7,  'Pacific Plate',    false),
(7,  'Nazca Plate',      false),
(7,  'Caribbean Plate',  false),
-- Q8
(8,  'Diego Rivera',           true),
(8,  'José Clemente Orozco',   false),
(8,  'Rufino Tamayo',          false),
(8,  'David Alfaro Siqueiros', false),
-- Q9
(9,  'Over 20 million', true),
(9,  'About 8 million', false),
(9,  'About 14 million', false),
(9,  'About 35 million', false),
-- Q10
(10, '25.3%', true),
(10, '8.1%',  false),
(10, '15.8%', false),
(10, '40.0%', false),

-- Buenos Aires Q11–Q20 
-- Q11
(11, 'Good Winds',   true),
(11, 'Blue River',   false),
(11, 'Silver Port',  false),
(11, 'Great Plains', false),
-- Q12
(12, 'Pedro de Mendoza', true),
(12, 'Juan de Garay',    false),
(12, 'Francisco Pizarro', false),
(12, 'Hernán Cortés',    false),
-- Q13
(13, '1580', true),
(13, '1541', false),
(13, '1610', false),
(13, '1776', false),
-- Q14
(14, 'Viceroyalty of the Río de la Plata', true),
(14, 'Viceroyalty of Peru',               false),
(14, 'Viceroyalty of New Spain',          false),
(14, 'Viceroyalty of New Granada',        false),
-- Q15
(15, 'Tango',   true),
(15, 'Salsa',   false),
(15, 'Cumbia',  false),
(15, 'Merengue', false),
-- Q16
(16, 'Porteños',      true),
(16, 'Bonaerenses',   false),
(16, 'Rioplatenses',  false),
(16, 'Platenses',     false),
-- Q17
(17, 'The largest port in South America',    true),
(17, 'The smallest port in South America',   false),
(17, 'The busiest military port',            false),
(17, 'The oldest port in South America',     false),
-- Q18
(18, 'University of Buenos Aires', true),
(18, 'Universidad de Palermo',     false),
(18, 'Universidad Austral',        false),
(18, 'Universidad del Salvador',   false),
-- Q19
(19, '1880', true),
(19, '1853', false),
(19, '1869', false),
(19, '1916', false),
-- Q20
(20, 'Peronism',     true),
(20, 'Federalism',   false),
(20, 'Radicalism',   false),
(20, 'Conservatism', false),

-- Barcelona Q21–Q30 
-- Q21
(21, 'The Phoenicians or Carthaginians', true),
(21, 'Romans only',                      false),
(21, 'The Visigoths',                    false),
(21, 'The Celts',                        false),
-- Q22
(22, '1992', true),
(22, '1988', false),
(22, '1996', false),
(22, '2000', false),
-- Q23
(23, 'Sagrada Família', true),
(23, 'La Catedral',     false),
(23, 'Casa Milà',       false),
(23, 'Palau Güell',     false),
-- Q24
(24, 'Catalonia',    true),
(24, 'Castile-León', false),
(24, 'Andalusia',    false),
(24, 'Valencia',     false),
-- Q25
(25, 'La Masia',    true),
(25, 'La Cantera',  false),
(25, 'El Clásico',  false),
(25, 'Camp Nou',    false),
-- Q26
(26, 'About one-fifth',  true),
(26, 'About one-third',  false),
(26, 'About one-half',   false),
(26, 'About two-thirds', false),
-- Q27
(27, 'Philip V',     true),
(27, 'Ferdinand II', false),
(27, 'Charles III',  false),
(27, 'Philip II',    false),
-- Q28
(28, 'La Rambla',             true),
(28, 'Passeig de Gràcia',     false),
(28, 'Avinguda Diagonal',     false),
(28, 'Carrer de la Princesa', false),
-- Q29
(29, 'Loyalist capital',         true),
(29, 'Nationalist headquarters', false),
(29, 'Neutral free zone',        false),
(29, 'Foreign press capital',    false),
-- Q30
(30, 'El Clásico',    true),
(30, 'La Liga Final', false),
(30, 'Copa del Rey',  false),
(30, 'La Rivalidad',  false),

-- Bogotá Q31–Q40
-- Q31
(31, 'Bacatá',      true),
(31, 'Chicamocha',  false),
(31, 'Zipaquirá',   false),
(31, 'Muisca',      false),
-- Q32
(32, '1538', true),
(32, '1492', false),
(32, '1521', false),
(32, '1571', false),
-- Q33
(33, '2,640 meters', true),
(33, '1,200 meters', false),
(33, '2,000 meters', false),
(33, '3,500 meters', false),
-- Q34
(34, 'Plaza de Bolívar',      true),
(34, 'Plaza Mayor',           false),
(34, 'Parque Simón Bolívar',  false),
(34, 'Plaza de Armas',        false),
-- Q35
(35, 'Gold Museum',          true),
(35, 'Museo Nacional',       false),
(35, 'Museo de Arte Colonial', false),
(35, 'Museo del Siglo XIX',  false),
-- Q36
(36, 'Avianca',       true),
(36, 'LATAM',         false),
(36, 'Copa Airlines', false),
(36, 'EasyFly',       false),
-- Q37
(37, 'Simón Bolívar',                true),
(37, 'Francisco de Paula Santander', false),
(37, 'Antonio Nariño',               false),
(37, 'Gonzalo Jiménez de Quesada',   false),
-- Q38
(38, 'Athens of South America',    true),
(38, 'City of Emeralds',           false),
(38, 'Pearl of the Andes',         false),
(38, 'City of Eternal Spring',     false),
-- Q39
(39, 'Spanish-speaking South America', true),
(39, 'All of Latin America',           false),
(39, 'Central America',                false),
(39, 'South America',                  false),
-- Q40
(40, 'Voluminous figurative art', true),
(40, 'Abstract minimalism',       false),
(40, 'Surrealist landscapes',     false),
(40, 'Geometric cubism',          false),

-- Lima Q41–Q50
-- Q41
(41, 'Rímac',      true),
(41, 'Inca',       false),
(41, 'Cuzco',      false),
(41, 'Pachacamac', false),
-- Q42
(42, 'Francisco Pizarro',          true),
(42, 'Hernán Cortés',              false),
(42, 'Diego de Almagro',           false),
(42, 'Gonzalo Jiménez de Quesada', false),
-- Q43
(43, 'Oldest university in South America',      true),
(43, 'Oldest university in the world',          false),
(43, 'Largest university in Latin America',     false),
(43, 'First Jesuit university in the Americas', false),
-- Q44
(44, '1988', true),
(44, '1975', false),
(44, '1991', false),
(44, '2000', false),
-- Q45
(45, 'A major earthquake',  true),
(45, 'A volcanic eruption', false),
(45, 'A tsunami',           false),
(45, 'A large flood',       false),
-- Q46
(46, 'The coastal location facilitated communication with Spain', true),
(46, 'It was warmer than Cuzco',                                  false),
(46, 'It had more gold deposits',                                 false),
(46, 'It had a larger native population',                         false),
-- Q47
(47, '1821', true),
(47, '1810', false),
(47, '1816', false),
(47, '1825', false),
-- Q48
(48, 'El Pulpo',         true),
(48, 'La Capital',       false),
(48, 'El Corazón',       false),
(48, 'La Ciudad Blanca', false),
-- Q49
(49, 'One-quarter',  true),
(49, 'One-eighth',   false),
(49, 'One-fifth',    false),
(49, 'One-third',    false),
-- Q50
(50, 'European Enlightenment influence', true),
(50, 'Inca revival',                     false),
(50, 'Industrial modernism',             false),
(50, 'Baroque colonial',                 false),

-- Cartagena Q51–Q60 
-- Q51
(51, '1533', true),
(51, '1510', false),
(51, '1525', false),
(51, '1551', false),
-- Q52
(52, 'Castle of San Felipe de Barajas', true),
(52, 'Fortress of Santa Catalina',      false),
(52, 'Fort San Fernando',               false),
(52, 'Walls of Cartagena',              false),
-- Q53
(53, 'Slave trade',   true),
(53, 'Spice trade',   false),
(53, 'Gold trade',    false),
(53, 'Tobacco trade', false),
-- Q54
(54, 'Opening of petroleum fields in the Magdalena River valley', true),
(54, 'Offshore drilling in the Caribbean',                        false),
(54, 'Discovery of oil near Santa Marta',                         false),
(54, 'Natural gas exports to Venezuela',                          false),
-- Q55
(55, '1811', true),
(55, '1800', false),
(55, '1821', false),
(55, '1830', false),
-- Q56
(56, 'San Basilio de Palenque', true),
(56, 'Palenquero',              false),
(56, 'Barranquilla',            false),
(56, 'Santa Marta',             false),
-- Q57
(57, 'Pedro de Heredia',    true),
(57, 'Juan de la Cosa',     false),
(57, 'Rodrigo de Bastidas', false),
(57, 'Juan de Garay',       false),
-- Q58
(58, '19th century', true),
(58, '17th century', false),
(58, '18th century', false),
(58, '20th century', false),
-- Q59
(59, 'Bolívar',    true),
(59, 'Córdoba',    false),
(59, 'Atlántico',  false),
(59, 'Sucre',      false),
-- Q60
(60, 'Spanish',    true),
(60, 'Portuguese', false),
(60, 'French',     false),
(60, 'English',    false),

-- Valladolid Q61–Q70
-- Q61
(61, 'Isabella of Castile and Ferdinand of Aragon', true),
(61, 'Philip II and Mary Tudor',                    false),
(61, 'Charles I and Isabella of Portugal',          false),
(61, 'Philip III and Margaret of Austria',          false),
-- Q62
(62, 'Christopher Columbus', true),
(62, 'Vasco da Gama',        false),
(62, 'Fernando Magellan',    false),
(62, 'Amerigo Vespucci',     false),
-- Q63
(63, '1346', true),
(63, '1218', false),
(63, '1509', false),
(63, '1600', false),
-- Q64
(64, 'Castile-León', true),
(64, 'Extremadura',  false),
(64, 'Aragon',       false),
(64, 'Navarre',      false),
-- Q65
(65, 'San Gregorio',             true),
(65, 'Cathedral of Valladolid',  false),
(65, 'San Pablo Church',         false),
(65, 'Santa Maria la Antigua',   false),
-- Q66
(66, 'The reign of Alfonso VII', true),
(66, 'The reign of Alfonso IV',  false),
(66, 'The reign of Alfonso X',   false),
(66, 'The reign of Ferdinand I', false),
-- Q67
(67, 'Philip II',   true),
(67, 'Philip III',  false),
(67, 'Charles I',   false),
(67, 'Ferdinand II', false),
-- Q68
(68, 'Automotive manufacturing', true),
(68, 'Petroleum refining',       false),
(68, 'Aerospace',                false),
(68, 'Mining',                   false),
-- Q69
(69, 'The granary of Spain',       true),
(69, 'The garden of Spain',        false),
(69, 'The breadbasket of Castile', false),
(69, 'The vineyard of Spain',      false),
-- Q70
(70, '1074', true),
(70, '924',  false),
(70, '1212', false),
(70, '1350', false),

-- Potosí Q71–Q80 
-- Q71
(71, '1545', true),
(71, '1532', false),
(71, '1558', false),
(71, '1610', false),
-- Q72
(72, 'Approximately 150,000', true),
(72, 'Approximately 50,000',  false),
(72, 'Approximately 100,000', false),
(72, 'Approximately 200,000', false),
-- Q73
(73, '4,050 meters', true),
(73, '2,500 meters', false),
(73, '3,200 meters', false),
(73, '5,000 meters', false),
-- Q74
(74, '1987', true),
(74, '1980', false),
(74, '1991', false),
(74, '2000', false),
-- Q75
(75, 'Casa de la Moneda', true),
(75, 'Casa del Tesoro',   false),
(75, 'Real Audiencia',    false),
(75, 'Palacio de Gobierno', false),
-- Q76
(76, 'Rich Mountain',  true),
(76, 'Silver Mountain', false),
(76, 'Land of Gold',   false),
(76, 'High Plateau',   false),
-- Q77
(77, 'More than 80%', true),
(77, 'About 20%',     false),
(77, 'About 40%',     false),
(77, 'About 60%',     false),
-- Q78
(78, 'Mita',           true),
(78, 'Encomienda',     false),
(78, 'Hacienda',       false),
(78, 'Repartimiento',  false),
-- Q79
(79, 'Spanish Empire',    true),
(79, 'British Empire',    false),
(79, 'Portuguese Empire', false),
(79, 'Dutch Empire',      false),
-- Q80
(80, 'Baroque',     true),
(80, 'Moorish',     false),
(80, 'Gothic',      false),
(80, 'Renaissance', false),

-- Mérida Q81–Q90 
-- Q81
(81, '1542', true),
(81, '1519', false),
(81, '1535', false),
(81, '1570', false),
-- Q82
(82, 'Henequen',     true),
(82, 'Rubber',       false),
(82, 'Tobacco',      false),
(82, 'Sisal cactus', false),
-- Q83
(83, 'Yucatán',      true),
(83, 'Campeche',     false),
(83, 'Quintana Roo', false),
(83, 'Tabasco',      false),
-- Q84
(84, 'Chichén Itzá', true),
(84, 'Teotihuacán',  false),
(84, 'Palenque',     false),
(84, 'Tulum',        false),
-- Q85
(85, '1922', true),
(85, '1850', false),
(85, '1890', false),
(85, '1950', false),
-- Q86
(86, 'It declined precipitously',     true),
(86, 'It expanded rapidly',           false),
(86, 'It shifted to exports to Asia', false),
(86, 'It became nationalized',        false),
-- Q87
(87, '1549', true),
(87, '1525', false),
(87, '1600', false),
(87, '1680', false),
-- Q88
(88, 'Citrus fruits such as limes and lemons', true),
(88, 'Coffee and cacao',                       false),
(88, 'Cotton and tobacco',                     false),
(88, 'Sugar cane',                             false),
-- Q89
(89, 'Olmec and Mayan',  true),
(89, 'Aztec and Toltec', false),
(89, 'Maya and Toltec',  false),
(89, 'Inca and Maya',    false),
-- Q90
(90, 'About 20 miles (30 km)', true),
(90, 'About 5 miles (8 km)',   false),
(90, 'About 50 miles (80 km)', false),
(90, 'About 100 miles (160 km)', false),

-- Asunción Q91–Q100 
-- Q91
(91, 'Feast of the Assumption', true),
(91, 'Feast of St. James',      false),
(91, 'Feast of Corpus Christi', false),
(91, 'Feast of the Epiphany',   false),
-- Q92
(92, 'Buenos Aires', true),
(92, 'Montevideo',   false),
(92, 'Lima',         false),
(92, 'Santiago',     false),
-- Q93
(93, '1811', true),
(93, '1806', false),
(93, '1821', false),
(93, '1830', false),
-- Q94
(94, 'Les Invalides',       true),
(94, 'The Panthéon',        false),
(94, 'Notre-Dame de Paris', false),
(94, 'Arc de Triomphe',     false),
-- Q95
(95, 'Jesuits',       true),
(95, 'Franciscans',   false),
(95, 'Dominicans',    false),
(95, 'Augustinians',  false),
-- Q96
(96, 'At its confluence with the Pilcomayo River', true),
(96, 'At the source of the Paraguay River',        false),
(96, 'At the widest point of the Paraguay River',  false),
(96, 'Where the Paraguay meets the Paraná',        false),
-- Q97
(97, 'Guaraní',  true),
(97, 'Quechua',  false),
(97, 'Aymara',   false),
(97, 'Tupí',     false),
-- Q98
(98, '1954', true),
(98, '1947', false),
(98, '1962', false),
(98, '1970', false),
-- Q99
(99, 'Universidad Nacional de Asunción', true),
(99, 'Universidad Católica de Asunción', false),
(99, 'Universidad Paraguaya',            false),
(99, 'Universidad Americana',            false),
-- Q100
(100, 'Argentina, Brazil, and Uruguay',       true),
(100, 'Bolivia, Chile, and Peru',             false),
(100, 'Colombia, Venezuela, and Ecuador',     false),
(100, 'Chile, Bolivia, and Argentina',        false);

-- City
INSERT INTO City (cityName, historyText, factsText, cityBanner) VALUES (
  'Austin',
  'Austin was founded in 1839 by Mirabeau Lamar, president of the Republic of Texas, who envisioned a grand capital city nestled along the Colorado River in the heart of the Texas Hill Country. Named after Stephen F. Austin, the "Father of Texas," the city was chosen for its central location and scenic surroundings, and it became the official capital of the Republic of Texas that same year. After Texas was annexed by the United States in 1845, Austin retained its role as the state capital, cementing its political importance for generations to come. Through the late 19th century, the city grew steadily, marked by the construction of the iconic Texas State Capitol building in 1888 — a structure that remains the largest state capitol by ground area in the country. Austin grew rapidly during the 20th century, fueled in part by the expanding influence of the University of Texas, founded in 1883, which attracted students, researchers, and eventually a thriving tech industry. By the latter half of the century, Austin had earned the nickname "Silicon Hills" as major technology companies like Dell, Apple, and later Tesla established major operations in the area. Today, Austin is one of the fastest-growing cities in the US, celebrated for its vibrant live music scene, diverse culture, and booming economy — a dynamic metropolis that has never lost sight of its rich historical roots.',
  'Austin is home to the University of Texas, one of the largest public universities in the nation with over 50,000 students, which anchors the city''s reputation as a hub for research, innovation, and education. The city hosts the world-renowned South by Southwest festival every March, drawing hundreds of thousands of visitors for a sprawling celebration of music, film, technology, and culture that has become one of the most influential creative gatherings on the planet. True to its nickname, the Live Music Capital of the World, Austin boasts more live music venues per capita than nearly any other city, with the legendary Sixth Street Entertainment District and the eclectic Red River Cultural District serving as the beating heart of its thriving music scene. Beyond the arts, Austin has emerged as a major technology and business powerhouse, with companies like Tesla, Apple, Google, and Oracle all maintaining significant presences in the city, drawing a steady influx of young professionals and entrepreneurs. The city is also famous for its beloved local food culture, particularly its celebrated barbecue traditions, vibrant Tex-Mex cuisine, and a thriving farm-to-table restaurant scene. With a population now surpassing one million residents in the city proper and nearly two million in the greater metro area, Austin consistently ranks among the top cities in the country for quality of life, job growth, and economic opportunity, all while working to preserve the creative, laid-back spirit captured in its unofficial motto: "Keep Austin Weird."',
  'austin_banner.png'
);

-- Austin (cityId = 11)
INSERT INTO Question (cityId, questionText) VALUES
(11, 'What is Austin''s unofficial motto?'),
(11, 'In what year was Austin founded?'),
(11, 'What university is located in Austin?'),
(11, 'What river runs through Austin?'),
(11, 'What is Austin known as the capital of?'),
(11, 'What famous music festival is held in Austin every year?'),
(11, 'What is the name of Austin''s airport?'),
(11, 'What is the tallest building in Austin?'),
(11, 'What expressway is commonly known as the main loop around Austin?'),
(11, 'What is the name of Austin''s famous bat colony location?'),
(11, 'What sport does Austin FC play?'),
(11, 'What is the name of Austin''s Formula 1 track?'),
(11, 'What state is Austin the capital of?'),
(11, 'What is the name of the famous Austin music venue on 6th Street?'),
(11, 'What major tech company moved its headquarters to Austin?'),
(11, 'What is the name of the large park along the Colorado River in Austin?'),
(11, 'What neighborhood is known as Austin''s tech hub?'),
(11, 'What is the name of Austin''s NBA G League team?'),
(11, 'Approximately what is Austin''s current city population?'),
(11, 'What is the name of the famous taco spot on East Cesar Chavez?');

INSERT INTO Answer (questionId, answerText, isCorrect) VALUES
-- Q101
(101, 'Keep Austin Weird', true),
(101, 'Live Free or Die', false),
(101, 'Keep It Real', false),
(101, 'Austin Strong', false),
-- Q102
(102, '1839', true),
(102, '1821', false),
(102, '1865', false),
(102, '1901', false),
-- Q103
(103, 'University of Texas', true),
(103, 'Texas A&M', false),
(103, 'Baylor University', false),
(103, 'Rice University', false),
-- Q104
(104, 'Colorado River', true),
(104, 'Brazos River', false),
(104, 'Rio Grande', false),
(104, 'Guadalupe River', false),
-- Q105
(105, 'Live Music Capital of the World', true),
(105, 'Country Music Capital', false),
(105, 'Jazz Capital of the South', false),
(105, 'Rock and Roll Capital', false),
-- Q106
(106, 'South by Southwest (SXSW)', true),
(106, 'Coachella', false),
(106, 'Austin City Limits only', false),
(106, 'Lollapalooza', false),
-- Q107
(107, 'Austin-Bergstrom International Airport', true),
(107, 'Austin Executive Airport', false),
(107, 'Texas Capital Airport', false),
(107, 'Lone Star Airport', false),
-- Q108
(108, 'Indeed Tower', true),
(108, 'Frost Bank Tower', false),
(108, '360 Condominiums', false),
(108, 'One Congress Plaza', false),
-- Q109
(109, 'MoPac Expressway (Loop 1)', true),
(109, 'Loop 410', false),
(109, 'Loop 202', false),
(109, 'Highway 130', false),
-- Q110
(110, 'Congress Avenue Bridge', true),
(110, 'South Lamar Bridge', false),
(110, 'Pfluger Pedestrian Bridge', false),
(110, 'First Street Bridge', false),
-- Q111
(111, 'Soccer', true),
(111, 'Basketball', false),
(111, 'Baseball', false),
(111, 'Hockey', false),
-- Q112
(112, 'Circuit of the Americas', true),
(112, 'Texas Motor Speedway', false),
(112, 'Austin International Raceway', false),
(112, 'Lone Star Circuit', false),
-- Q113
(113, 'Texas', true),
(113, 'Oklahoma', false),
(113, 'New Mexico', false),
(113, 'Louisiana', false),
-- Q114
(114, 'Stubb''s Amphitheater', true),
(114, 'The Alamo', false),
(114, 'Red Rocks Austin', false),
(114, 'The Paramount', false),
-- Q115
(115, 'Tesla', true),
(115, 'Apple', false),
(115, 'Google', false),
(115, 'Amazon', false),
-- Q116
(116, 'Zilker Park', true),
(116, 'Barton Springs Park', false),
(116, 'Auditorium Shores', false),
(116, 'McKinney Falls Park', false),
-- Q117
(117, 'The Domain', true),
(117, 'South Congress', false),
(117, 'East 6th Street', false),
(117, 'Rainey Street', false),
-- Q118
(118, 'Austin Spurs', true),
(118, 'Austin Aces', false),
(118, 'Texas Legends', false),
(118, 'Capitol City Ballers', false),
-- Q119
(119, 'Over 1 million', true),
(119, 'About 500,000', false),
(119, 'About 750,000', false),
(119, 'About 2 million', false),
-- Q120
(120, 'Juan in a Million', true),
(120, 'Torchy''s Tacos', false),
(120, 'Veracruz All Natural', false),
(120, 'Joe''s Tacos', false);