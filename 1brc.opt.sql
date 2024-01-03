.timer on
.maxrows 9999
.echo on

SELECT station_name, 
        MIN(measurement) AS min_measurement,
        CAST(AVG(measurement) AS DECIMAL(8,1)) AS mean_measurement,
        MAX(measurement) AS max_measurement
FROM READ_CSV('measurements.txt', header=false, columns= {'station_name':'VARCHAR','measurement':'double'}, delim=';') 
GROUP BY station_name
ORDER BY station_name;

.quit
