
WITH daily_rides AS (

    SELECT 
        STRFTIME('%Y-%m-%d', tpep_pickup_datetime) AS ride_date,
        COUNT(*) AS ride_count,
        AVG(trip_distance) AS avg_distance
    FROM 
        taxi_trips
    WHERE 
        tpep_pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY 
        ride_date

    UNION ALL

    SELECT 
        STRFTIME('%Y-%m-%d', pickup_datetime) AS ride_date,
        COUNT(*) AS ride_count,
        AVG(trip_miles) AS avg_distance
    FROM 
        uber_trips
    WHERE 
        pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY 
        ride_date
),
aggregated_rides AS (

    SELECT 
        ride_date,
        SUM(ride_count) AS total_rides,
        AVG(avg_distance) AS avg_distance
    FROM 
        daily_rides
    GROUP BY 
        ride_date
),
top_10_days AS (

    SELECT 
        ride_date,
        total_rides,
        avg_distance
    FROM 
        aggregated_rides
    ORDER BY 
        total_rides DESC
    LIMIT 11
)
SELECT 
    t.ride_date,
    t.total_rides,
    t.avg_distance,
    COALESCE(w.DailyPrecipitation, 0) AS avg_precipitation,
    COALESCE(w.DailyAverageWindSpeed, 0) AS avg_wind_speed
FROM 
    top_10_days t
LEFT JOIN 
    daily_weather w ON t.ride_date = STRFTIME('%Y-%m-%d', w.Date)
ORDER BY 
    t.total_rides DESC
LIMIT 10 OFFSET 1;
