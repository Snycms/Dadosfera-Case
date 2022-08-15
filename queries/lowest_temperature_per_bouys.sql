WITH  min_temperature_per_station AS (
    SELECT 
        MIN(sea_temperature) AS min_temperature,
        station_id
    FROM `case-estagio.dadosfera.waves_data`
    GROUP BY station_id
    )
SELECT 
    wave_data.station_id,
    min_temperature AS lowest_temperature,
    EXTRACT(MONTH from event_time) AS occur_month
FROM min_temperature_per_station
JOIN `case-estagio.dadosfera.waves_data` AS wave_data 
    ON wave_data.sea_temperature = min_temperature_per_station.min_temperature
    AND wave_data.station_id = min_temperature_per_station.station_id
    GROUP BY station_id, lowest_temperature, occur_month
