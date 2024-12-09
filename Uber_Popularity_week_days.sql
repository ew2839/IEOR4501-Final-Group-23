
SELECT 
    STRFTIME('%w', pickup_datetime) AS day_of_week,
    COUNT(*) AS ride_count
FROM 
    uber_trips
WHERE 
    pickup_datetime NOT LIKE '2024-9%'
GROUP BY 
    day_of_week
ORDER BY 
    day_of_week;
