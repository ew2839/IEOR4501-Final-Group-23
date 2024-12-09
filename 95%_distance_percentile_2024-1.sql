
WITH combined_distances AS (
    SELECT trip_distance AS distance
    FROM taxi_trips
    WHERE tpep_pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
    UNION ALL
    SELECT trip_miles AS distance
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
),
sorted_distances AS (
    SELECT 
        distance,
        ROW_NUMBER() OVER (ORDER BY distance) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM combined_distances
),
percentile_95 AS (
    SELECT 
        distance
    FROM 
        sorted_distances
    WHERE 
        row_num >= 0.95 * total_rows
    ORDER BY 
        row_num ASC
    LIMIT 1
)
SELECT distance AS distance_95_percentile FROM percentile_95;
