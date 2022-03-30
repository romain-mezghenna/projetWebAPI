const express = require("express")
const bodyParser = require("body-parser")
const cors = require("cors")
const fs = require("fs")
const path = require('path')
const https = require('https')
const app = express()
const router = express.Router()
const {sql} = require('./src/models/db')

// //Settings up options for HTTPS
// const key = fs.readFileSync(path.join(__dirname, 'certificate', 'server.key'));
// const cert = fs.readFileSync(path.join(__dirname, 'certificate', 'server.cert'));
// const options = { key, cert };

// Somes middlewares
app.use(cors())
app.use(bodyParser.json())

// Routes
require("./src/routes/router.js")(router)
app.use('/',router)

const PORT = process.env.PORT || 3000

app.listen(PORT, () => {
    console.log(`API is running on port ${PORT}, Go on https://localhost:${PORT}`);
})
// https.createServer(options, app).listen(PORT, () => {
//     console.log(`API is running on port ${PORT}, Go on https://localhost:${PORT}`);
// })
setInterval(() => {
    // Ping the Database for reset wait_timeout to prevent disconnection
    sql.query("SELECT 1", (err, res) => {
        if (err) {
            console.log("error: ", err);
            return;
        }
        console.log("ping");
    });
}, 9999);
