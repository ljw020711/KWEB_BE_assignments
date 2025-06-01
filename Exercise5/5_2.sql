SELECT users.id, users.name, tickets.seat_number FROM tickets INNER JOIN users ON tickets.user = users.id WHERE tickets.train = 11 ORDER BY tickets.seat_number ASC;

SELECT users.id, users.name, Count(tickets.train) AS trains_count, Sum(trains.distance) AS total_distance FROM users INNER JOIN tickets ON users.id = tickets.user INNER JOIN trains ON tickets.train = trains.id GROUP BY users.id, users.name ORDER BY total_distance DESC LIMIT 6;

SELECT 
    trains.id,
    types.name,
    source_station.name AS src_stn,
    destination_station.name AS dst_stn,
    TIMEDIFF(trains.arrival, trains.departure) AS travel_time
FROM trains
INNER JOIN types ON trains.type = types.id
INNER JOIN stations AS source_station ON trains.source = source_station.id
INNER JOIN stations AS destination_station ON trains.destination = destination_station.id
ORDER BY travel_time DESC
LIMIT 6;

SELECT 
    types.name AS type,
    src.name AS src_stn,
    dst.name AS dst_stn,
    trains.departure,
    trains.arrival,
    Round((trains.distance * types.fare_rate) / 10, -2) AS fare
FROM trains
INNER JOIN types ON trains.type = types.id
INNER JOIN stations AS src ON trains.source = src.id
INNER JOIN stations AS dst ON trains.destination = dst.id
ORDER BY trains.departure ASC;

SELECT 
    trains.id,
    types.name AS type,
    src.name AS src_stn,
    dst.name AS dst_stn,
    COUNT(tickets.id) AS occupied,
    types.max_seats AS maximum
FROM trains
JOIN types ON trains.type = types.id
JOIN stations AS src ON trains.source = src.id
JOIN stations AS dst ON trains.destination = dst.id
JOIN tickets ON trains.id = tickets.train
GROUP BY trains.id, types.name, src.name, dst.name, types.max_seats
ORDER BY trains.id ASC;


SELECT 
    trains.id,
    types.name AS type,
    src.name AS src_stn,
    dst.name AS dst_stn,
    COUNT(tickets.id) AS occupied,
    types.max_seats AS maximum
FROM trains
JOIN types ON trains.type = types.id
JOIN stations AS src ON trains.source = src.id
JOIN stations AS dst ON trains.destination = dst.id
LEFT JOIN tickets ON trains.id = tickets.train
GROUP BY trains.id, types.name, src.name, dst.name, types.max_seats
ORDER BY trains.id ASC;


