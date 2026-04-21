CREATE DATABASE air_quality_db;
USE air_quality_db;

CREATE TABLE location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(50),
    state VARCHAR(100),
    city VARCHAR(100),
    station VARCHAR(200),
    latitude FLOAT,
    longitude FLOAT
);

CREATE TABLE pollutant (
    pollutant_id VARCHAR(20) PRIMARY KEY
);



CREATE TABLE AQI(
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    location_id INT,
    pollutant_id VARCHAR(20),
    last_update DATETIME,
    pollutant_min FLOAT,
    pollutant_max FLOAT,
    pollutant_avg FLOAT,
    
    FOREIGN KEY (location_id) REFERENCES location(location_id),
    FOREIGN KEY (pollutant_id) REFERENCES pollutant(pollutant_id)
);

CREATE TABLE air_quality_raw (
    country VARCHAR(50),
    state VARCHAR(100),
    city VARCHAR(100),
    station VARCHAR(200),
    last_update DATETIME,
    latitude FLOAT,
    longitude FLOAT,
    pollutant_id VARCHAR(20),
    pollutant_min FLOAT,
    pollutant_max FLOAT,
    pollutant_avg FLOAT
);


##Business insights

##1. Cities with highest pollution
SELECT l.city, AVG(a.pollutant_avg) AS avg_aqi
FROM AQI a
JOIN location l ON a.location_id = l.location_id
WHERE a.pollutant_id = 'PM2.5'
GROUP BY l.city
ORDER BY avg_aqi DESC
LIMIT 10;

##2. Cities with cleanest air
SELECT l.city, AVG(a.pollutant_avg) AS avg_aqi
FROM AQI a
JOIN location l ON a.location_id = l.location_id
WHERE a.pollutant_id = 'PM2.5'
GROUP BY l.city
ORDER BY avg_aqi ASC
LIMIT 10;



##3. Metro vs Non-Metro comparison
SELECT 
    CASE 
        WHEN l.city IN ('Delhi','Mumbai','Bangalore','Hyderabad','Chennai','Kolkata')
        THEN 'Metro'
        ELSE 'Non-Metro'
    END AS city_type,
    AVG(a.pollutant_avg) AS avg_aqi
FROM AQI a
JOIN location l ON a.location_id = l.location_id
WHERE a.pollutant_id = 'PM2.5'
GROUP BY city_type;

##4. Pollutants contributing most
SELECT p.pollutant_id, AVG(a.pollutant_avg) AS avg_level
FROM AQI a
JOIN pollutant p ON a.pollutant_id = p.pollutant_id
GROUP BY p.pollutant_id
ORDER BY avg_level DESC;

##5. Pollutant contributing most to poor AQI
SELECT p.pollutant_id, COUNT(*) AS high_pollution_days
FROM AQI a
JOIN pollutant p ON a.pollutant_id = p.pollutant_id
WHERE a.pollutant_avg > 150
GROUP BY p.pollutant_id
ORDER BY high_pollution_days DESC;


##6. AQI Category Distribution (Health Impact)
SELECT 
    CASE 
        WHEN pollutant_avg <= 50 THEN 'Good'
        WHEN pollutant_avg <= 100 THEN 'Satisfactory'
        WHEN pollutant_avg <= 200 THEN 'Moderate'
        WHEN pollutant_avg <= 300 THEN 'Poor'
        ELSE 'Severe'
    END AS category,
    COUNT(*) AS count
FROM AQI
WHERE pollutant_id = 'PM2.5'
GROUP BY category;

