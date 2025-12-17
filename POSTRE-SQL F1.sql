CREATE TABLE f1_sao_paulo_grand_prix (
    Position INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    F1_Team VARCHAR(50),
    Race_Time DECIMAL(20, 3)
);

INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (1, 'Lando', 'Norris', 'McLaren', 5521.596);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (2, 'Kimi', 'Antonelli', 'Mercedes', 5532.0);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (3, 'Max', 'Verstappen', 'Red Bull', 5532.346);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (4, 'George', 'Russel', 'Mercedes', 5536.863);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (5, 'Oscar', 'Piastri', 'Mclaren', 5537.345);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (6, 'Oliver', 'Bearman', 'Haas', 5551.226);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (7, 'Liam', 'Lawson', 'Racing Bulls', 5574.238);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (8, 'Isack', 'Hadjar','Racing Bulls', 5574.469);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (9, 'Nico', 'Hülkenberg', 'Sauber', 5574.920);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (10,'Pierre', 'Gasly', 'Alpine', 5575.510);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (11,'Alexander', 'Albon', 'Williams', 5575.780);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (12,'Esteban', 'Ocon', 'Haas', 5576.292);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (13,'Carlo', 'Sainz', 'Williams', 5577.016);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (14,'Fernando', 'Alonso', 'Aston Martin', 5577.362);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (15,'Franco', 'Colapinto', 'Alpine', 5579.373);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (16,'Lance', 'Stroll', 'Aston Martin', 5579.843);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (17,'Yuki', 'Tsunoda', 'Red Bull', 5590.772);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (18,'Charles', 'Leclerc', 'Ferrari', 0.0);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (19,'Lewis', 'Hamilton', 'Ferrari', 0.0);
INSERT INTO F1_Sao_Paulo_Grand_Prix VALUES (20,'Gabriel', 'Bortoleto', 'Sauber', 0.0);

SELECT * FROM f1_sao_paulo_grand_prix
LIMIT 0, 1000;

UPDATE F1_Sao_Paulo_Grand_Prix
SET First_name = 'Lewis',
    Last_name = 'Hamilton',
    Race_Time = '0.0'
WHERE Position = 18;

UPDATE F1_Sao_Paulo_Grand_Prix
SET First_name = 'Charles',
    Last_name = 'Leclerc',
    Race_Time = '0.0'
WHERE Position = 19;


ALTER TABLE F1_Sao_Paulo_Grand_Prix
ADD Pit_Stops DECIMAL(2, 1);

UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 1;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 2;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 3 WHERE Position = 3;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 4;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 5;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 6;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 1 WHERE Position = 7;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 8;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 1 WHERE Position = 9;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 10;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 11;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 12;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 13;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 14;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 15;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 2 WHERE Position = 16;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 1 WHERE Position = 17;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 3 WHERE Position = 18;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 1 WHERE Position = 19;
UPDATE f1_sao_paulo_grand_prix SET Pit_Stops = 0 WHERE Position = 20;


SELECT
    F1_Team,
    COUNT(*) AS Drivers_In_Race,
    AVG(Race_Time) AS Avg_Race_Time,
    AVG(Pit_Stops) AS Avg_Pit_Stops
FROM F1_Sao_Paulo_Grand_Prix
GROUP BY F1_Team
ORDER BY Avg_Race_Time;

SELECT 
   position,
   First_name,
   Last_name,
   F1_Team,
   Race_Time,
   Race_Time - MIN(Race_Time) OVER() AS Time_Gap
FROM f1_sao_paulo_grand_prix
ORDER BY Position;

SELECT 
   First_name,
   Last_name,
   F1_Team,
   'DNF' AS STATUS
FROM f1_sao_paulo_grand_prix
WHERE Race_Time = 0.0;

SELECT
   First_name,
   Last_name,
   Pit_Stops,
   Race_Time,
   Race_Time / NULLIF(Pit_Stops, 0) AS Time_Per_Pit_Stop
FROM f1_sao_paulo_grand_prix
ORDER BY Time_Per_Pit_stop;

SELECT
   F1_Team,
   SUM(CASE
           WHEN Position = 1 THEN 25
           WHEN Position = 2 THEN 18
           WHEN Position = 3 THEN 15
           WHEN Position = 4 THEN 12
           WHEN Position = 5 THEN 10
           WHEN Position = 6 THEN 8
           WHEN Position = 7 THEN 6
           WHEN Position = 8 THEN 4
           WHEN Position = 9 THEN 2
           WHEN Position = 10 THEN 1
           ELSE 0
		END) AS Team_Points
	FROM f1_sao_paulo_grand_prix
    GROUP BY F1_Team
    ORDER BY Team_Points DESC;


	CREATE VIEW team_summary AS 
	SELECT
	   F1_Team,
	   COUNT(*) AS Drivers,
	   AVG(Race_Time) AS Avg_Race_Time,
	   AVG(Pit_Stops) AS Avg_Pit_Stops
	FROM f1_sao_paulo_grand_prix
	GROUP BY F1_Team;
	  
