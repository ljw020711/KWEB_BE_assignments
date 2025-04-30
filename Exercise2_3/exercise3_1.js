const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true}));

app.get('/', (req, res) => {
    let result = '';
    
    for (let key in req.query)
    {
        let value = req.query[key];

        result += (`${key}: ${value}\n`);
    }

    res.send(result);
});

app.post('/', (req, res) => {
    let obj = req.body;

    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.put('/', (req, res) => {
    let obj = req.body;

    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.delete('/', (req, res) => {
    let obj = req.body;

    res.send(Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'));
});

app.listen(port, () => {
});