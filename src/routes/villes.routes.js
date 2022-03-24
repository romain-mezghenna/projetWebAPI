module.exports = (router) => {
    const villes = require("../controllers/villes.controller.js");
    const {
        auth
    } = require("../middlewares/auth.middleware")

    // Create a new vol
    router.post("/villes", auth, villes.save);

    // Retrieve all villes
    router.get("/villes", auth, villes.findAll);

    // Retrieve a single vol with idVol
    router.get("/villes/:id", auth, villes.findOneId);

    // Update a vol with idVol
    router.patch("/villes/:id", auth, villes.update);

    // Delete a vol with idVol
    router.delete("/villes/:id", auth, villes.delete);

};
