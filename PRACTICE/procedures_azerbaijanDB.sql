-- 'PROCEDURE - 1' ----------------------------------------------------------------------------------
-- IN parameter : Get all details of region by given region name.
DELIMITER //

CREATE PROCEDURE GetRegionByName(
	IN regName VARCHAR(255)
)
BEGIN
	SELECT * 
 	FROM regions
	WHERE region_name = regName;
END //

DELIMITER ;

CALL GetRegionByName('Aran');
+-----------+-------------+----------+------------+
| region_id | region_name | area     | population |
+-----------+-------------+----------+------------+
|         6 | Aran        | 23375.00 |    1893036 |
+-----------+-------------+----------+------------+


-- 'PROCEDURE - 2' --------------------------------------------------------------------------------
-- IN parameter : Get all cities by given 'region name'.
DELIMITER //

CREATE PROCEDURE GetCitiesByRegion1(
	IN regName VARCHAR(255)
)
BEGIN
	SELECT division_name
 	FROM administrative_divisions
	WHERE region = regName;
END //

DELIMITER ;

CALL GetCitiesByRegion1('Absheron');

+-------------------+
| division_name     |
+-------------------+
| Absheron District |
| Baku (city)       |
| Sumqayit (city)   |
| Khizi District    |
+-------------------+


-- 'PROCEDURE - 3' --------------------------------------------------------------------------------
-- IN and OUT parameters: Get total number of cities by given region name.
DELIMITER $$

CREATE PROCEDURE GetCityCountsByRegion (
	IN  regName VARCHAR(255),
	OUT cityCount INT
)
BEGIN
	SELECT COUNT(*)
	INTO cityCount
	FROM administrative_divisions
	WHERE region = regName;
END$$

DELIMITER ;

CALL GetCityCountsByRegion('Shaki-Zaqatala', @cityCount);
SELECT @cityCount;

+------------+
| @cityCount |
+------------+
|          7 |
+------------+


-- 'PROCEDURE - 4' --------------------------------------------------------------------------------
-- INOUT parameter : Get total number of all divisions by given region name.
delimiter //
create procedure sample(INOUT reg varchar(100))
begin
    select count(*) into reg from administrative_divisions where region = reg;
end//
delimiter ;

set @reg = 'Aran';
call sample(@reg);
select @reg;

+------+
| @reg |
+------+
| 18   |
+------+


--'PROCEDURE - 5' --------------------------------------------------------------------------------
-- IN and multiply OUT parameters :
-- Get the total number of: 'capitals', 'non-capitals', 'total-cities' from given region
DELIMITER  //

CREATE PROCEDURE GetCapitalTotalCities(
    IN regName VARCHAR(255),
    OUT capitals INT,
    OUT nonCapitals INT,
    OUT totalCities INT
)
BEGIN
-- count of capitals
    SELECT COUNT(capital)
    INTO capitals 
    FROM administrative_divisions
    WHERE region = regName;
-- count of non-capitals
    SELECT COUNT(*)
    INTO nonCapitals 
    FROM administrative_divisions
    WHERE region = regName
    AND capital IS NULL;
-- count of captotal cities
    SELECT COUNT(*)
    INTO totalCities 
    FROM administrative_divisions
    WHERE region = regName;

END //

DELIMITER ;
CALL GetCapitalTotalCities('Absheron', @capitals, @nonCapitals, @totalCities);
SELECT @capitals, @nonCapitals, @totalCities;

+-----------+--------------+--------------+
| @capitals | @nonCapitals | @totalCities |
+-----------+--------------+--------------+
|         2 |            2 |            4 |
+-----------+--------------+--------------+


-- 'PROCEDURE - 5' --------------------------------------------------------------------------------
-- IN and multiply OUT parameters :
-- 'Get the <total sum of population> and <total area> of each region'
DELIMITER $$

CREATE PROCEDURE GetAreaPopulationByRegion (
	IN  regName VARCHAR(255),
	OUT totalPopulation INT,
    OUT totalArea FLOAT(10,2)
)
BEGIN
-- sum of population
	SELECT SUM(population)
	INTO totalPopulation
	FROM administrative_divisions
	WHERE region = regName;

-- sum of area
    SELECT SUM(area)
	INTO totalArea
	FROM administrative_divisions
	WHERE region = regName;
END$$

DELIMITER ;
CALL GetAreaPopulationByRegion('Shaki-Zaqatala', @totalPopulation, @totalArea);
SELECT @totalPopulation, @totalArea ; 

+------------------+------------+
| @totalPopulation | @totalArea |
+------------------+------------+
|           639000 |       8969 |
+------------------+------------+


-- 'PROCEDURE - 6' --------------------------------------------------------------------------------
-- IN and multiply OUT parameters :
-- 'Get the <min area> and the <max area> of given region'
DELIMITER $$

CREATE PROCEDURE GetMinMaxAreaByRegion (
	IN  regName VARCHAR(255),
	OUT minArea FLOAT(10, 2),
    OUT maxArea FLOAT(10, 2)
)
BEGIN
-- min area
    SELECT MIN(area)
	INTO minArea
	FROM administrative_divisions
	WHERE region = regName;
-- max area
	SELECT MAX(area)
	INTO maxArea
	FROM administrative_divisions
	WHERE region = regName;
END$$

DELIMITER ;
CALL GetMinMaxAreaByRegion('Ganja-Qazakh', @minArea, @maxArea);
SELECT @minArea, @maxArea ; 


-- 'PROCEDURE - 7' --------------------------------------------------------------------------------
-- IN and multiply OUT parameters :
-- 'Get the <min area with division name> and the <max area with division name> of given region'
-- METHOD - 1 :------------------------------------
DELIMITER $$

CREATE PROCEDURE GetMinMaxAreaByRegion2 (
	IN  regName VARCHAR(255),
    OUT minArea VARCHAR(255),
    OUT maxArea VARCHAR(255)
)
BEGIN
-- min area 
    SELECT CONCAT( division_name, ',', area )
	INTO minArea
	FROM administrative_divisions
	WHERE region = regName
    ORDER BY area
    LIMIT 1 ;
-- max area 
    SELECT CONCAT( division_name, ',', area )
	INTO maxArea
	FROM administrative_divisions
	WHERE region = regName
    ORDER BY area DESC
    LIMIT 1 ;
END$$

DELIMITER ;
CALL GetMinMaxAreaByRegion2('Aran', @minArea, @maxArea);
SELECT @minArea, @maxArea ; 

+----------------------+--------------------------+
| @minArea             | @maxArea                 |
+----------------------+--------------------------+
| Shirvan (city),30.00 | Imishli District,1820.00 |
+----------------------+--------------------------+



#---------------------------------------------------------------------------------------------------
# 'SHOW PROCEDURES for azerbaijan DB:'
/* SHOW PROCEDURE STATUS WHERE db = 'azerbaijan'; */
/* SHOW PROCEDURE STATUS LIKE '%area%'; */

# 'SHOW only PROCEDURE NAMES for azerbaijan DB:'
/* SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
AND routine_schema = 'azerbaijan'; */

# 'DELETE PROCEDURES'
/* DROP PROCEDURE GetRegionByName; */
