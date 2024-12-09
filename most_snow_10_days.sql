
WITH snowiest_days AS (
    SELECT 
        DATE(Date) AS snow_date,
        CASE 
            WHEN DailySnowfall = 'T' THEN 0
            ELSE CAST(DailySnowfall AS FLOAT)
        END AS total_snowfall
    FROM 
        daily_weather
    WHERE 
        Date BETWEEN '2020-01-01' AND '2024-08-31'
    ORDER BY 
        total_snowfall DESC
    LIMIT 10
)
SELECT 
    s.snow_date,
    s.total_snowfall,
    (SELECT COUNT(*) 
     FROM taxi_trips 
     WHERE DATE(tpep_pickup_datetime) = s.snow_date) +
    (SELECT COUNT(*) 
     FROM uber_trips 
     WHERE DATE(pickup_datetime) = s.snow_date) AS total_rides
FROM 
    snowiest_days s;
