module.exports = (router) => {
    const pays = require("../controllers/pays.controller.js");
    const {
        auth
    } = require("../middlewares/auth.middleware")

    // Retrieve all pays
    router.get("/pays", pays.findAll);

    // Retrieve a single vol with idVol
    router.get("/pays/:id", pays.findOneId);

};
