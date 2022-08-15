WITH  max_watter_level AS (
    SELECT 
        MAX(water_level_lat) AS max_watter_level
    FROM `case-estagio.dadosfera.tide_data`
    WHERE IS_NAN(water_level_lat) = false 
    )
SELECT 
    latitude,
    longitude,
    max_watter_level AS watter_level,
    EXTRACT(MONTH from event_time) AS occur_month
FROM max_watter_level
JOIN `case-estagio.dadosfera.tide_data` AS tides_data 
    ON tides_data.water_level_lat = max_watter_level.max_watter_level