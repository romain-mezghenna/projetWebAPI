const express = require("express")
const bodyParser = require("body-parser")
const cors = require("cors")
const fs = require("fs")
const path = require('path')
const https = require('https')
const app = express()
const router = express.Router()

//Settings up options for HTTPS
const key = fs.readFileSync(path.join(__dirname, 'certificate', 'server.key'));
const cert = fs.readFileSync(path.join(__dirname, 'certificate', 'server.cert'));
const options = { key, cert };

// Somes middlewares
app.use(cors())
app.use(bodyParser.json())

// Routes
require("./src/routes/router.js")(router)
app.use('/',router)

const PORT = process.env.PORT || 3000
https.createServer(options, app).listen(PORT, () => {
    console.log(`API is running on port ${PORT}, Go on https://localhost:${PORT}`);
})
