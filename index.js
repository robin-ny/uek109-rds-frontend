
/**
 * Module dependencies.
 */

var express = require('express');
var path = require('path');
require("dotenv").config();
var app = module.exports = express();


// config
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(express.static('public'));
app.use(express.json())

const pgp = require('pg-promise')()
//const db = pgp('postgres://'+process.env.DB_USER+':'+process.env.DB_PASS+'@'+process.env.DB_HOST+':'+process.env.DB_PORT+'/'+process.env.DB_DATABASE)
const db = pgp('postgres://postgres:9uxXYpq5yTxGK8U2rZ@localhost:5432/uek109')
function queryMembers(fn){
    db.query("select * from member")
  .then((ret) => {
    return fn(ret)
  })
  .catch((error) => {
    console.log(error)
    return fn(null)
  })
};



app.get('/', function(req, res){
  res.render("index");
});

app.put('/', function (req, res, next){
  queryMembers(function(members){
    if(members){
      res.send({members})
    }
  });
});

if (!module.parent) {
  app.listen(3000);
  console.log('Express started on port 3000');
}
