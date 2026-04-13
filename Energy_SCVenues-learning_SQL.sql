-- SC Venue Sustainability Project
-- Schema
--clear tables
DROP TABLE IF EXISTS energy_usage;
DROP TABLE IF EXISTS Events;
DROP TABLE IF EXISTS Venues;
-- turn on linking ability
PRAGMA foreign_keys = ON;

--Create Tables
CREATE TABLE Venues ( Venue_id char(3) PRIMARY KEY, Venue_name varchar(30) NOT NULL, city varchar(30), yrbuilt int(4), LEED bool, Roof bool, capacity int(5),recent_reno int(4));  
CREATE TABLE Events (Event_id INTEGER PRIMARY KEY AUTOINCREMENT, Venue_id char(3),event_name varchar(30), event_type text CHECK (event_type IN ('concert', 'pro_sports', 'college_sports')), month int(2), event_year int(4), attendance int(5),FOREIGN KEY (venue_id) REFERENCES venues(venue_id));
CREATE TABLE energy_usage (energy_id INTEGER PRIMARY KEY AUTOINCREMENT,event_id INTEGER NOT NULL UNIQUE,kwh_used REAL, renewable_pct REAL NOT NULL CHECK (renewable_pct BETWEEN 0 AND 100),solar_contribution_kwh REAL NOT NULL DEFAULT 0,FOREIGN KEY (event_id) REFERENCES events(event_id));

--Insert Data
INSERT INTO Venues
VALUES 
	('WB','Williams Brice Stadium', 'Columbia',1934,0,1,80250,1982),
    ('CL', 'Colonial Life Arena', 'Columbia',2002,0,0,18000,NULL),
    ('BSW','Bon-Secours Wellness','Greenville',1998,1,0,15000, NULL),
    ('FF','Fluor Field','Greenville',2006,0,1,6700,2026),
    ('NCC', 'North Charelston Colesium','North Charelston',1991,0,0,13000,2025),
    ('C1','Credit One Arena','Charelston',2001,0,1,11000,2022),
    ('SP', 'Segra Park','Columbia',2016,1,1,9000,2025),
    ('MS','Memorial Stadium','Clemson',1923,0,1,81500,2023);

INSERT INTO Events (Venue_id, event_name, event_type, month, event_year, attendance)
VALUES
    ('WB', 'USC vs Clemson', 'college_sports', 11, 2023, 80100),
    ('WB', 'USC vs Georgia', 'college_sports', 9, 2024, 76500),
    ('WB', 'Morgan Wallen Concert', 'concert', 6, 2024, 72000),
    ('WB', 'USC vs Vanderbilt', 'college_sports', 10, 2023, 61000),
    ('WB', 'USC vs Kentucky', 'college_sports', 3, 2025, 54500),
    ('CL', 'USC vs Kentucky SEC Tournament', 'college_sports', 2, 2024, 17800),
    ('CL', 'Zach Bryan Concert', 'concert', 4, 2024, 17500),
    ('CL', 'USC vs Tennessee', 'college_sports', 1, 2023, 15200),
    ('CL', 'Luke Combs Concert', 'concert', 9, 2025, 14000),
    ('CL', 'USC vs Ole Miss', 'college_sports', 2, 2025, 9800),
    ('BSW', 'Swamp Rabbits Playoff Game', 'pro_sports', 4, 2024, 14200),
    ('BSW', 'Chris Stapleton Concert', 'concert', 8, 2023, 13800),
    ('BSW', 'Swamp Rabbits vs Jacksonville', 'pro_sports', 12, 2023, 10500),
    ('BSW', 'Disney on Ice', 'concert', 2, 2025, 9200),
    ('BSW', 'Swamp Rabbits vs Florida', 'pro_sports', 1, 2025, 6800),
    ('FF', 'Drive Opening Day', 'pro_sports', 4, 2023, 5650),
    ('FF', 'Fourth of July Game', 'pro_sports', 7, 2024, 5700),
    ('FF', 'Drive vs Augusta Playoff', 'pro_sports', 9, 2024, 5400),
    ('FF', 'Drive vs Rome', 'pro_sports', 6, 2023, 3800),
    ('FF', 'Drive vs Delmarva', 'pro_sports', 8, 2025, 2100),
    ('NCC', 'Foo Fighters Concert', 'concert', 5, 2023, 12800),
    ('NCC', 'Disney on Ice', 'concert', 1, 2024, 11500),
    ('NCC', 'Stingrays Playoff Game', 'pro_sports', 4, 2024, 10200),
    ('NCC', 'Stingrays vs Florida', 'pro_sports', 11, 2023, 7400),
    ('NCC', 'Stingrays vs Savannah', 'pro_sports', 2, 2025, 4600),
    ('C1', 'Charleston Open Finals', 'pro_sports', 4, 2023, 7400),
    ('C1', 'Charleston Open Semifinals', 'pro_sports', 4, 2024, 6800),
    ('C1', 'Dave Matthews Band Concert', 'concert', 7, 2024, 7100),
    ('C1', 'Charleston Open Round of 16', 'pro_sports', 4, 2025, 5200),
    ('C1', 'Matchbox Twenty Concert', 'concert', 8, 2023, 3900),
    ('SP', 'Fireflies Opening Day', 'pro_sports', 4, 2023, 8400),
    ('SP', 'Fourth of July Game', 'pro_sports', 7, 2023, 8500),
    ('SP', 'Fireflies vs Augusta Playoff', 'pro_sports', 9, 2024, 7800),
    ('SP', 'Fireflies vs Down East', 'pro_sports', 6, 2025, 5100),
    ('SP', 'Fireflies vs Kannapolis', 'pro_sports', 8, 2024, 2900),
    ('MS', 'Clemson vs South Carolina', 'college_sports', 11, 2023, 81500),
    ('MS', 'Clemson vs NC State', 'college_sports', 10, 2024, 79200),
    ('MS', 'Clemson vs Florida State', 'college_sports', 9, 2023, 76800),
    ('MS', 'Clemson vs Wake Forest', 'college_sports', 11, 2024, 68400),
    ('MS', 'Clemson vs Georgia Tech', 'college_sports', 10, 2025, 61000);

INSERT INTO energy_usage (event_id, kwh_used, renewable_pct, solar_contribution_kwh)
VALUES
    (1, 17179.0, 8.0, 0),    
    (2, 16955.0, 7.0, 0),   
    (3, 16663.0, 6.0, 0),  
    (4, 15958.0, 9.0, 0),   
    (5, 15545.0, 7.0, 0),    
    (6, 4422.0, 15.0, 0),   
    (7, 4400.0, 13.0, 0),    
    (8, 4228.0, 14.0, 0),   
    (9, 4139.0, 16.0, 0),    
    (10, 3829.0, 12.0, 0),  
    (11, 2984.0, 42.0, 5261.0),   
    (12, 2960.0, 40.0, 4966.0),   
    (13, 2760.0, 38.0, 4453.0),  
    (14, 2681.0, 43.0, 4914.0),  
    (15, 2535.0, 41.0, 4443.0),  
    (16, 1218.0, 7.0, 0),    
    (18, 1201.0, 7.0, 0),    
    (19, 1099.0, 6.0, 0),    
    (20, 989.0, 9.0, 0),   
    (21, 3191.0, 14.0, 0),  
    (22, 3095.0, 13.0, 0), 
    (23, 2999.0, 15.0, 0),   
    (24, 2794.0, 12.0, 0),  
    (25, 2586.0, 11.0, 0),  
    (26, 1601.0, 9.0, 0),    
    (27, 1562.0, 8.0, 0),  
    (28, 1582.0, 7.0, 0),   
    (29, 1460.0, 9.0, 0),  
    (30, 1376.0, 6.0, 0),  
    (31, 1178.0, 38.0, 1913.0),  
    (32,1183.0, 40.0, 2028.0),  
    (33,1154.0, 39.0, 1928.0),  
    (34,1041.0, 41.0, 1830.0),  
    (35,949.0, 38.0, 1541.0),   
    (36, 17464.0, 6.0, 0),   
    (37, 17324.0, 7.0, 0),  
    (38, 17167.0, 8.0, 0),   
    (39, 16625.0, 6.0, 0),   
    (40, 16154.0, 7.0, 0); 

--QueriesEvents

--Question1: What is the average of kWh/attendee by each event type?
SELECT e.event_type,
       ROUND(AVG(eu.kwh_used / e.attendance), 4) AS avg_kwh_per_attendee
FROM energy_usage eu
JOIN Events e ON eu.event_id = e.Event_id
GROUP BY e.event_type;

--Question2: What is the energy/attendee by venue?
SELECT Venues.venue_name,
	ROUND(SUM(energy_usage.kwh_used) / SUM(Events.attendance), 4) AS avg_kwh_per_attendee
FROM Events
INNER Join Venues On Venues.venue_id=Events.Venue_id
Inner JOIN energy_usage ON energy_usage.event_id=Events.Event_id
GROUP By Venue_name 
ORDER BY avg_kwh_per_attendee DESC;

--Does leed certification actually matter?
SELECT CASE WHEN Venues.LEED = 1 THEN 'Certified' ELSE 'Not Certified' END AS leed_status, 
       COUNT(DISTINCT Venues.Venue_id) AS number_of_venues,
       ROUND(AVG(energy_usage.kwh_used), 2) AS avg_kwh
FROM energy_usage
INNER JOIN Events ON energy_usage.event_id = Events.Event_id
INNER JOIN Venues ON Events.Venue_id=Venues.Venue_id
GROUP BY Venues.LEED 
ORDER BY avg_kwh DESC;

--Question4: What is the change in energy year to year by venue
WITH yearlyCTE AS (
  Select Venues.venue_name, Events.event_year,
      ROUND(SUM(energy_usage.kwh_used) / SUM(Events.attendance), 4) AS avg_kwh_per_attendee
  FROM Events
  INNER Join Venues On Venues.venue_id=Events.Venue_id
  Inner JOIN energy_usage ON energy_usage.event_id=Events.Event_id
  GROUP By Venue_name, event_year 
)
SELECT 
avg_kwh_per_attendee,
venue_name,
event_year
FROM yearlyCTE
OrDER BY venue_name, event_year;

--Question5: What is the final ranking
WITH yearlyCTE AS (
  Select Venues.venue_name,
      ROUND(SUM(energy_usage.kwh_used) / SUM(Events.attendance), 4) AS avg_kwh_per_attendee
  FROM Events
  INNER Join Venues On Venues.venue_id=Events.Venue_id
  Inner JOIN energy_usage ON energy_usage.event_id=Events.Event_id
  GROUP By Venue_name
),

scoringCTE AS(
  SELECT *, 
  ROUND(AVG(energy_usage.renewable_pct), 4) AS avg_renewable_pct
  FROM yearlyCTE
  Inner Join Venues On yearlyCTE.venue_name=Venues.Venue_name
  INNER JOIN Events ON Events.Venue_id=Venues.Venue_id
  Inner JOIN energy_usage ON Events.Event_id=energy_usage.event_id
  GROUP BY yearlyCTE.venue_name
  )
  
  SELECT venue_name,
       avg_kwh_per_attendee,
       avg_renewable_pct,
 	   ROUND(avg_renewable_pct + (1.0 / avg_kwh_per_attendee) * 10, 2) AS score
  From scoringCTE
  Order BY score DESC
 
