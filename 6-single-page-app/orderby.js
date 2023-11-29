const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();

// Connection details
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: 'usa'
});

// Make MySQL connection
con.connect( (err) => {
    if (err) throw err;
    console.log('MySQL Connection is working!');
});

// Setting up EJS templates
app.set('view engine', 'ejs');

// Express body parser
app.use(express.urlencoded({ extended: true }));

// Creating Routes
app.get('/', (req, res) => {
    con.query(`SELECT * FROM states`, (err, result, fields) => {
        if(err) throw err;
        console.log(fields);
        res.render('orderby', {states: result});
    })
});

app.post('/', (req, res) => {
    if(req.body.order){
        var orderVal = req.body.order;
        console.log(orderVal);

        con.query(`SELECT * FROM states ORDER BY ${orderVal}`, (err, result, fields) => {
            if(err) throw err;
            console.log(result);
            res.render('orderby', {states: result});
        });
    }
})

const PORT = 3000;
app.listen(PORT, console.log(`The server is running on ${PORT}`));