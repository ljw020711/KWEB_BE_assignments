const { runQuery } = require('./runquery');

const getFareByUserId = async (uid) => {
  const sql = `
    SELECT ROUND(SUM(trains.distance * types.fare_rate) / 10.0, -2) AS total_fare
    FROM tickets
    JOIN trains ON tickets.train = trains.id
    JOIN types ON trains.type = types.id
    WHERE tickets.user = ${uid};
  `;
  const results = await runQuery(sql);
  return results[0]?.total_fare ?? 0;
};

const getTrainStatusById = async (tid) => {
  const sql = `
    SELECT COUNT(tickets.id) AS occupied, types.max_seats
    FROM trains
    JOIN types ON trains.type = types.id
    LEFT JOIN tickets ON trains.id = tickets.train
    WHERE trains.id = ${tid}
    GROUP BY types.max_seats;
  `;
  const results = await runQuery(sql);
  if (results.length === 0) return null;
  const { occupied, max_seats } = results[0];
  return occupied >= max_seats ? 'Sold Out' : 'Available';
};

module.exports = { getFareByUserId, getTrainStatusById };
