const express = require('express');
const { getFareByUserId, getTrainStatusById } = require('./train');

const app = express();
const port = 3000;

app.get('/fare', async (req, res) => {
  try {
    const uid = req.query.uid;
    const fare = await getFareByUserId(uid);
    res.type('text/plain').send(`${fare}`);
  } catch (err) {
    console.error(err);
    res.status(500).type('text/plain').send('Internal Server Error');
  }
});

app.get('/train/status', async (req, res) => {
  try {
    const tid = req.query.tid;
    const status = await getTrainStatusById(tid);
    if (status === null) {
      res.type('text/plain').send('Train Not Found');
    } else {
      res.type('text/plain').send(status);
    }
  } catch (err) {
    console.error(err);
    res.status(500).type('text/plain').send('Internal Server Error');
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
