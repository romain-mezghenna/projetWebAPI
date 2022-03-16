const express = require("express")
const cors = require("cors")
const app = express()
const router = express.Router()

app.use(cors())

const PORT = process.env.PORT || 3000
app.listen(PORT, () => {
    console.log(`API is running on port ${PORT}`);
})