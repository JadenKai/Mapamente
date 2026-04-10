SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Answer;
TRUNCATE TABLE Question;
TRUNCATE TABLE City;
SET FOREIGN_KEY_CHECKS = 1;

-- City
INSERT INTO City (cityName, historyText, factsText, cityBanner) VALUES (
  'Austin',
  'Austin was founded in 1839 and became the capital of the Republic of Texas. It grew rapidly during the 20th century and is now one of the fastest-growing cities in the US.',
  'Austin is home to the University of Texas, South by Southwest festival, and is known as the Live Music Capital of the World.',
  'austin_banner.jpg'
);

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