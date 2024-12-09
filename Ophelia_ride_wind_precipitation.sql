
WITH hourly_weather_data AS (
    SELECT 
        STRFTIME('%Y-%m-%d %H', Date) AS date_hour,
        SUM(HourlyPrecipitation) AS total_precipitation,
        AVG(HourlyWindspeed) AS avg_wind_speed
    FROM 
        hourly_weather
    WHERE 
        Date BETWEEN '2023-09-25' AND '2023-10-04'
    GROUP BY 
        date_hour
),
taxi_rides AS (
    SELECT 
        STRFTIME('%Y-%m-%d %H', tpep_pickup_datetime) AS date_hour,
        COUNT(*) AS taxi_ride_count
    FROM 
        taxi_trips
    WHERE 
        tpep_pickup_datetime BETWEEN '2023-09-25' AND '2023-10-04'
    GROUP BY 
        date_hour
),
uber_rides AS (
    SELECT 
        STRFTIME('%Y-%m-%d %H', pickup_datetime) AS date_hour,
        COUNT(*) AS uber_ride_count
    FROM 
        uber_trips
    WHERE 
        pickup_datetime BETWEEN '2023-09-25' AND '2023-10-04'
    GROUP BY 
        date_hour
)
SELECT 
    w.date_hour,
    COALESCE(t.taxi_ride_count, 0) + COALESCE(u.uber_ride_count, 0) AS total_rides,
    COALESCE(w.total_precipitation, 0) AS total_precipitation,
    COALESCE(w.avg_wind_speed, 0) AS avg_wind_speed
FROM 
    hourly_weather_data w
LEFT JOIN 
    taxi_rides t ON w.date_hour = t.date_hour
LEFT JOIN 
    uber_rides u ON w.date_hour = u.date_hour
ORDER BY 
    w.date_hour ASC;
