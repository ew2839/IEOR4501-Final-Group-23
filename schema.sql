
CREATE TABLE IF NOT EXISTS hourly_weather (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Station INTEGER,
    Date TEXT,
    Latitude FLOAT,
    Longitude FLOAT,
    Elevation FLOAT,
    Report_type TEXT,
    SOURCE INTEGER,
    HourlyAltimetersetting FLOAT,
    HourlyDewPointTemperature FLOAT,
    HourlyDryBulbTemperatureHourlyPrecipitation FLOAT,
    HourlyPresentWeatherTypeHourlyPressureChange FLOAT,
    HourlyPressureTendency FLOAT,
    HourlyRelativeHumidity FLOAT,
    HourlySkyConditions FLOAT,
    HourlySeaLevelPressure FLOAT,
    HourlyStationPressure FLOAT,
    HourlyVisibility FLOAT,
    HourlyWetBulbTemperature FLOAT,
    HourlyWindDirection FLOAT,
    HourlyWindGustSpeed FLOAT,
    HourlyWindspeed FLOAT
);


CREATE TABLE IF NOT EXISTS daily_weather (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Station INTEGER,
    Date TEXT,
    Latitude FLOAT,
    Longitude FLOAT,
    Elevation FLOAT,
    Report_type TEXT,
    SOURCE INTEGER,
    Sunrise FLOAT,
    Sunset FLOAT,
    DailyAverageDewPointTemperature FLOAT,
    DailyAverageDryBulbTemperature FLOAT,
    DailyAverageRelativeHumidity FLOAT,
    DailyAverageSeaLevelPressure FLOAT,
    DailyAverageStationPressure FLOAT,
    DailyAverageWetBulbTemperature FLOAT,
    DailyAverageWindSpeed FLOAT,
    DailyCoolingDegreeDays FLOAT,
    DailyDepartureFromNormalAverageTemperature FLOAT,
    DailyHeatingDegreeDays FLOAT,
    DailyMaximumDryBulbTemperature FLOAT,
    DailyMinimumDryBulbTemperature FLOAT,
    DailvPeakWindDirection FLOAT,
    DailyPeakWindspeed FLOAT,
    DailyPrecipitation FLOAT,
    DailySnowDepth FLOAT,
    DailySnowfall FLOAT,
    DailySustainedwindDirection FLOAT,
    DailySustainedWindspeed FLOAT,
    DailyWeather FLOAT
);


CREATE TABLE IF NOT EXISTS taxi_trips (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tpep_pickup_datetime TEXT,
    trip_distance FLOAT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    improvement_surcharge FLOAT,
    congestion_surcharge FLOAT,
    pickup_latitude FLOAT,
    pickup_longitude FLOAT,
    dropoff_latitude FLOAT,
    dropoff_longitude FLOAT
);


CREATE TABLE IF NOT EXISTS uber_trips (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pickup_datetime TEXT,
    dropoff_datetime TEXT,
    trip_miles FLOAT,
    base_passenger_fare FLOAT,
    tolls FLOAT,
    sales_tax FLOAT,
    congestion_surcharge FLOAT,
    airport_fee FLOAT,
    tips FLOAT£¬
    pickup_latitude FLOAT,
    pickup_longitude FLOAT,
    dropoff_latitude FLOAT,
    dropoff_longitude FLOAT
);

