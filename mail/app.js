const express = require('express');
const hbs = require('hbs');
const path = require("path");
const app = express();

app.set("view engine", "hbs");
app.set("views", path.join(__dirname, "public"));

app.use(express.static(path.join(__dirname, 'public')));

app.get("/", (req, res) => { 
    res.render("index");
});

app.get("/help", (req, res) => { 
    res.render("help");
});

app.listen(3000, () => {
    console.log(`Server is running on port 3000`);
});
