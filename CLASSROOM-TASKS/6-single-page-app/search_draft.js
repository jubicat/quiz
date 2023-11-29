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

const PORT = 3000;
app.listen(PORT, console.log(`The server is running on ${PORT}`));