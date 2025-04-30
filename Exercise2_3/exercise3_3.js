const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true}));

app.get('/factorial', (req, res) => {

    return res.redirect(`/factorial/${req.query.number}`);
});

app.get('/factorial/:number', (req, res) => {
    let num = req.params.number;

    res.send(`${factorial(num)}`);
});

function factorial(x) 
{
    let x_fac = 1;

    for(; x > 0; x--)
    {
        x_fac *= x;
    }

    return x_fac;
}

app.listen(port, () => {
});