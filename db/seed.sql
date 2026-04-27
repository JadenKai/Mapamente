-- Testing information Exclusively

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Answer;
TRUNCATE TABLE Question;
TRUNCATE TABLE City;
SET FOREIGN_KEY_CHECKS = 1;

-- User
INSERT INTO User (username, passwordHash, profilePic) VALUES (
  "testUser", "nomamesguey", "nomamesguey"
);

-- City
/*INSERT INTO City (cityName, historyText, factsText, cityBanner) VALUES (
  'Austin',
  'Austin was founded in 1839 by Mirabeau Lamar, president of the Republic of Texas, who envisioned a grand capital city nestled along the Colorado River in the heart of the Texas Hill Country. Named after Stephen F. Austin, the "Father of Texas," the city was chosen for its central location and scenic surroundings, and it became the official capital of the Republic of Texas that same year. After Texas was annexed by the United States in 1845, Austin retained its role as the state capital, cementing its political importance for generations to come. Through the late 19th century, the city grew steadily, marked by the construction of the iconic Texas State Capitol building in 1888 — a structure that remains the largest state capitol by ground area in the country. Austin grew rapidly during the 20th century, fueled in part by the expanding influence of the University of Texas, founded in 1883, which attracted students, researchers, and eventually a thriving tech industry. By the latter half of the century, Austin had earned the nickname "Silicon Hills" as major technology companies like Dell, Apple, and later Tesla established major operations in the area. Today, Austin is one of the fastest-growing cities in the US, celebrated for its vibrant live music scene, diverse culture, and booming economy — a dynamic metropolis that has never lost sight of its rich historical roots.',
  'Austin is home to the University of Texas, one of the largest public universities in the nation with over 50,000 students, which anchors the city''s reputation as a hub for research, innovation, and education. The city hosts the world-renowned South by Southwest festival every March, drawing hundreds of thousands of visitors for a sprawling celebration of music, film, technology, and culture that has become one of the most influential creative gatherings on the planet. True to its nickname, the Live Music Capital of the World, Austin boasts more live music venues per capita than nearly any other city, with the legendary Sixth Street Entertainment District and the eclectic Red River Cultural District serving as the beating heart of its thriving music scene. Beyond the arts, Austin has emerged as a major technology and business powerhouse, with companies like Tesla, Apple, Google, and Oracle all maintaining significant presences in the city, drawing a steady influx of young professionals and entrepreneurs. The city is also famous for its beloved local food culture, particularly its celebrated barbecue traditions, vibrant Tex-Mex cuisine, and a thriving farm-to-table restaurant scene. With a population now surpassing one million residents in the city proper and nearly two million in the greater metro area, Austin consistently ranks among the top cities in the country for quality of life, job growth, and economic opportunity, all while working to preserve the creative, laid-back spirit captured in its unofficial motto: "Keep Austin Weird."',
  'austin_banner.png'
);*/

-- Questions (cityId = 1)
INSERT INTO Question (cityId, questionText) VALUES
(1, 'What is Austin\'s official slogan?'),
(1, 'In what year was Austin founded?'),
(1, 'What university is located in Austin?'),
(1, 'What river runs through Austin?'),
(1, 'What is Austin known as the capital of?'),
(1, 'What famous music festival is held in Austin every year?'),
(1, 'What is the name of Austin\'s airport?'),
(1, 'What is the tallest building in Austin?'),
(1, 'Which highway loops around Austin?'),
(1, 'What is the name of Austin\'s famous bat colony location?'),
(1, 'What sport does the Austin FC play?'),
(1, 'What is the name of Austin\'s Formula 1 track?'),
(1, 'What state is Austin the capital of?'),
(1, 'What is the name of the famous Austin music venue on 6th Street?'),
(1, 'What tech company has its headquarters in Austin?'),
(1, 'What is the name of the large park along the Colorado River in Austin?'),
(1, 'What neighborhood is known as Austin\'s tech hub?'),
(1, 'What is the name of Austin\'s NBA G League team?'),
(1, 'What year did Austin\'s population reach 1 million?'),
(1, 'What is the name of the famous taco spot on South Congress?');

-- Answers (4 per question, questionId 1-20)
INSERT INTO Answer (questionId, answerText, isCorrect) VALUES
-- Q1
(1, 'Keep Austin Weird', true),
(1, 'Live Free or Die', false),
(1, 'Keep It Real', false),
(1, 'Austin Strong', false),
-- Q2
(2, '1839', true),
(2, '1821', false),
(2, '1865', false),
(2, '1901', false),
-- Q3
(3, 'University of Texas', true),
(3, 'Texas A&M', false),
(3, 'Baylor University', false),
(3, 'Rice University', false),
-- Q4
(4, 'Colorado River', true),
(4, 'Brazos River', false),
(4, 'Rio Grande', false),
(4, 'Guadalupe River', false),
-- Q5
(5, 'Live Music Capital of the World', true),
(5, 'Country Music Capital', false),
(5, 'Jazz Capital of the South', false),
(5, 'Rock and Roll Capital', false),
-- Q6
(6, 'South by Southwest (SXSW)', true),
(6, 'Coachella', false),
(6, 'Austin City Limits only', false),
(6, 'Lollapalooza', false),
-- Q7
(7, 'Austin-Bergstrom International Airport', true),
(7, 'Austin Executive Airport', false),
(7, 'Texas Capital Airport', false),
(7, 'Lone Star Airport', false),
-- Q8
(8, 'Indeed Tower', true),
(8, 'Frost Bank Tower', false),
(8, '360 Condominiums', false),
(8, 'One Congress Plaza', false),
-- Q9
(9, 'MoPac Expressway (Loop 1)', true),
(9, 'Loop 410', false),
(9, 'Loop 202', false),
(9, 'Highway 130', false),
-- Q10
(10, 'Congress Avenue Bridge', true),
(10, 'South Lamar Bridge', false),
(10, 'Pfluger Pedestrian Bridge', false),
(10, 'First Street Bridge', false),
-- Q11
(11, 'Soccer', true),
(11, 'Basketball', false),
(11, 'Baseball', false),
(11, 'Hockey', false),
-- Q12
(12, 'Circuit of the Americas', true),
(12, 'Texas Motor Speedway', false),
(12, 'Austin International Raceway', false),
(12, 'Lone Star Circuit', false),
-- Q13
(13, 'Texas', true),
(13, 'Oklahoma', false),
(13, 'New Mexico', false),
(13, 'Louisiana', false),
-- Q14
(14, 'Stubb\'s Amphitheater', true),
(14, 'The Alamo', false),
(14, 'Red Rocks Austin', false),
(14, 'The Paramount', false),
-- Q15
(15, 'Tesla', true),
(15, 'Apple', false),
(15, 'Google', false),
(15, 'Amazon', false),
-- Q16
(16, 'Zilker Park', true),
(16, 'Barton Springs Park', false),
(16, 'Auditorium Shores', false),
(16, 'McKinney Falls Park', false),
-- Q17
(17, 'The Domain', true),
(17, 'South Congress', false),
(17, 'East 6th Street', false),
(17, 'Rainey Street', false),
-- Q18
(18, 'Austin Spurs', true),
(18, 'Austin Aces', false),
(18, 'Texas Legends', false),
(18, 'Capitol City Ballers', false),
-- Q19
(19, '2020', true),
(19, '2010', false),
(19, '2015', false),
(19, '2025', false),
-- Q20
(20, 'Juan in a Million', true),
(20, 'Torchy\'s Tacos', false),
(20, 'Veracruz All Natural', false),
(20, 'Joe\'s Tacos', false);
