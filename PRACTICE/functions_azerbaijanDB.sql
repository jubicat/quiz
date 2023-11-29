-- 'STORED FUNCTIONS IN SQL'--------------------------------------------------------------------

-- FUNCTION - 1: 'Return cities customizing by population like: small, big' --------------------
DELIMITER $$

CREATE FUNCTION RegionSize(
	population INT
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE regionSize VARCHAR(20);

    IF population >= 1000000 THEN
		SET regionSize = 'big region';
    ELSEIF population < 1000000 THEN
        SET regionSize = 'small region';
    END IF;
	-- return the region size
	RETURN (regionSize);
END$$

DELIMITER ;

-- 'Using RegionSize function in statement'
SELECT 
    region_name, 
    RegionSize(population)
FROM
    regions;


-- FUNCTION - 2: 'Return regions by area percentage' --------------------------------------------
DROP FUNCTION IF EXISTS getPercentageArea;
DELIMITER $$
CREATE FUNCTION getPercentageArea(
	area_of_region int
)
RETURNS float
DETERMINISTIC
BEGIN
	DECLARE per_area float;
	SET per_area = round( ((area_of_region / (select sum(area) from azerbaijan.regions))*100), 2);
	RETURN per_area;
END $$
DELIMITER ;

-- using function in sql statement
SELECT region_name, getPercentageArea(area) from regions;

+---------------------+-------------------------+
| region_name         | getPercentageArea(area) |
+---------------------+-------------------------+
| Absheron            |                    6.11 |
| Ganja-Qazakh        |                   14.06 |
| Shaki-Zaqatala      |                   10.11 |
| Lankaran            |                    6.92 |
| Guba-Khachmaz       |                    7.84 |
| Aran                |                   26.34 |
| Upper Karabakh      |                    8.18 |
| Kalbajar-Lachin     |                    7.21 |
| Mountainous Shirvan |                    6.83 |
| Nakhchivan          |                    6.25 |
| Kzaakh              |                    0.14 |
+---------------------+-------------------------+
11 rows in set (0.00 sec)


-- Metod-2 ------------------------------------------------------------------------------------
DELIMITER //
CREATE FUNCTION CalculatesRegionPercentage(
    region_area INT, 
    total_area INT
    )
RETURNS FLOAT
DETERMINISTIC
BEGIN
    RETURN (region_area / total_area) * 100;
END //

DELIMITER ;
SELECT
    region_name,
    CalculatesRegionPercentage(area, (SELECT SUM(area) FROM regions)) AS percentage
FROM regions;