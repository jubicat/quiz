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

// global variables for messages
var result = '';
var errMessage = '';

// Creating Routes

app.get('/', (req, res) => {
    res.render('search', {searchres: result, error: errMessage});
});

app.post('/', (req, res) => {
    if(req.body.search && req.body.item){
        var colName = req.body.item;
        var keyword = req.body.search;
        console.log(colName, keyword);
        con.query(`SELECT * FROM states WHERE ${colName} LIKE "%${keyword}%"`, (err, result, fields) => {
            if(err) throw err;
            res.render('search', {searchres: result, error: errMessage});
        });
    }else{
        console.log(`Search keyword is not selected`);
        var errMessage = 'Search keyword is not selected';
        res.render('search', {error: errMessage, searchres: result});
    }
})

const PORT = 3000;
app.listen(PORT, console.log(`The server is running on ${PORT}`));