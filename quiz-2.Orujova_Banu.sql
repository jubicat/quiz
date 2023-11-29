-- task1

-- CREATE DATABASE worldcountries DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
-- USE worldcountries;

--  task2

-- CREATE TABLE CONTINENTS (
--     continent_id INT PRIMARY KEY,
--     continent_name VARCHAR(50) NOT NULL
-- );

-- CREATE TABLE COUNTRIES (
--     country_code VARCHAR(3) PRIMARY KEY,
--     country_name VARCHAR(50) NOT NULL,
--     continent_id INT
-- );

-- CREATE TABLE CITIES (
--     city_id INT(10) auto_increment PRIMARY KEY,
--     city_name VARCHAR(50) NOT NULL,
--     population INT NOT NULL,
--     year INT(4) NOT NULL,
--     capital int(1) DEFAULT 0,
--     country_code VARCHAR(3)
-- );

-- task3

-- ALTER TABLE COUNTRIES
-- ADD FOREIGN KEY (continent_id) REFERENCES CONTINENTS(continent_id)
-- ON UPDATE RESTRICT
-- ON DELETE SET NULL;

-- ALTER TABLE CITIES
-- ADD FOREIGN KEY (country_code) REFERENCES COUNTRIES(country_code)
-- ON UPDATE RESTRICT
-- ON DELETE SET NULL;

-- task4

-- INSERT INTO continents (continent_id, continent_name) 
-- VALUES
-- (1, 'Europe'),
-- (2, 'Asia'),
-- (3, 'Africa'),
-- (4, 'America'),
-- (5, 'Australia');

-- task5

-- INSERT INTO countries (country_code, country_name, continent_id) 
-- VALUES
-- ("TR","Turkey",1),
-- ("AZ","Azerbaijan",2),
-- ("Ru","Russia",1),
-- ("AU","Australia",5),
-- ("SW","Sweden",1),
-- ("IR","Iran",2),
-- ("FR","France",1),
-- ("SP","Spain",2),
-- ("ARG","Argentina",4),
-- ("BR","Brasil",4),
-- ("VE","Venesuela",4),
-- ("JP","Japan",2),
-- ("CO","Congo",3),
-- ("NG","Nigeria",3),
-- ("KO","Korea",2);

-- task6

-- INSERT INTO cities (city_name, country_code, population, year, capital) 
-- VALUES
-- ("Istanbul","TR",100000,1800,0),
-- ("Baku","AZ",3000000,1975,0),
-- ("Moscow","RU",4000000,1050,1),
-- ("Melburn","AU",5000000,300,0),
-- ("Malmo","SW",7000000,1500,0),
-- ("Tehran","IR",50000,1902,1),
-- ("Paris","FR",500000,1450,1),
-- ("Barcelona","SP",400000,1400,0),
-- ("Karakas","VE",900000,1800,1),
-- ("Buenos Aires","ARG",170000,1870,1),
-- ("Rio","BR",900000,1700,0),
-- ("Tokio","JP",8000000,1900,1),
-- ("Bukavu","CO",80000,1600,0),
-- ("Abuca","NG",100000,1500,0),
-- ("Seul","KO",9154000,1940,1);

-- task7

-- SELECT continent_name, GROUP_CONCAT(country_name) as COUNTRIES 
-- FROM CONTINENTS 
-- INNER JOIN COUNTRIES on continents.continent_id=countries.continent_id
-- GROUP BY continents.continent_id;

-- task8

-- SELECT countries.country_name,cities.city_name 
-- FROM cities
-- LEFT JOIN countries on countries.country_code = cities.country_code
-- WHERE cities.capital = 1;

-- task9

-- SELECT continent_name, group_concat(city_name) as city_names, sum(population) as total_population
-- FROM continents
-- LEFT JOIN countries on continents.continent_id = countries.continent_id
-- LEFT JOIN cities on countries.country_code = cities.country_code
-- GROUP BY continent_name;

-- task10

-- SELECT country_name, city_name, year,
-- CASE
--     WHEN year <= 1000 then 'ancient'
--     WHEN year > 1000 and year <= 1900 then 'old'
--     WHEN year > 1900 then 'modern'
--     END AS era
-- FROM countries
-- LEFT JOIN cities on countries.country_code = cities.country_code
-- ORDER BY country_name, city_name;

-- task11

-- SELECT country_name, countries.country_code, capital_city, count(city_name) as city_count, sum(population) as total_population
-- FROM countries
-- LEFT JOIN (
--     SELECT city_name, country_code, population, case
--     WHEN capital = 1 THEN city_name
--     END AS capital_city
--     FROM cities
-- ) AS cities ON countries.country_code = cities.country_code
-- GROUP BY country_name, countries.country_code, capital_city;
