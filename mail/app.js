const express = require('express');
const hbs = require('hbs');
const path = require('path');
const fs = require('fs');
const app = express();

const db = require('./db/db');
const { sendEmails } = require('./services/sendEmail');

app.set("view engine", "hbs");
app.set('views', path.join(__dirname, 'views'));

app.use(express.json());

hbs.registerPartials(__dirname + '/views/partials');

app.get("/", (req, res) => { 
    res.render("index", {title: 'Test hbs', message: 'dziala'});
});

app.get("/help", (req, res) => { 
    res.render("help");
});

app.get('/email', async (req, res) => {
    try {
        const users = await db.readAll("cmsUsers");
        res.render('email', { users });
    } catch (error) {
        console.error(error);
        res.status(500).send("Error retrieving users from database");
    }
});

app.post('/send-emails', async (req, res) => {
    const emails = req.body.emails;

    try {
        await sendEmails(emails, db);
        res.status(200).send({ message: 'E-maile zostały wysłane' });
    } catch (error) {
        console.error('Błąd podczas wysyłania e-maili:', error);
        res.status(500).send('Błąd podczas wysyłania e-maili');
    }
});

app.listen(3000, () => {
    console.log(`Server is running on port 3000`);
});
