module.exports = (router) => {
    const vols = require("../controllers/vols.controller.js");
    const {
        auth
    } = require("../middlewares/auth.middleware")

    // Create a new vol
    router.post("/vols", auth, vols.save);

    // Retrieve all vols
    router.get("/vols", auth, vols.findAll);

    // Retrieve a single vol with idVol
    router.get("/vols/:id", auth, vols.findOneId);

    // Update a vol with idVol
    router.patch("/vols/:id", auth, vols.update);

    // Delete a vol with idVol
    router.delete("/vols/:id", auth, vols.delete);

};
