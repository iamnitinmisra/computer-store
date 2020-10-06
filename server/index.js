require('dotenv').config();
const massive = require('massive');
const express = require('express')
const session = require('express-session')
const authCtrl = require('./controller/authCtrl')
const { SERVER_PORT, SESSION_SECRET, CONNECTION_STRING } = process.env
const { login, logout } = authCtrl

const app = express()

app.use(express.json())

app.use(session({
    resave: false,
    saveUninitialized: true,
    cooke: {
        maxAge: 1000 * 60 * 60 * 24 * 7  },
        secret: SESSION_SECRET
}))

// API Endpoints

// Auth
app.get('/auth/login', login)
app.get('/auth/logout', logout)

massive({
    connectionString: CONNECTION_STRING,
    ssl: { rejectUnauthorized: false }
}).then(db=> {
    app.set('db', db)
    console.log("Database connection established")
    app.listen(SERVER_PORT, ()=>console.log(`Server is listening on port ${SERVER_PORT}`))
})