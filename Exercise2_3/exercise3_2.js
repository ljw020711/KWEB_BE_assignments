const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true}));

app.get('/board/page/:page', (req, res) => {
    let num = req.params.page;

    res.send(`This is page #${num}`);
});

app.listen(port, () => {
});