module.exports = (router) => {
    const lanceurs = require("../controllers/lanceurs.controller.js");
    const {
        auth
    } = require("../middlewares/auth.middleware")

    // Create a new companie
    router.post("/lanceurs", auth, lanceurs.save);

    // Retrieve all lanceurs
    router.get("/lanceurs",lanceurs.findAll);

    // Retrieve a single companie with idCompanie
    router.get("/lanceurs/:id", lanceurs.findOneId);

    // Update a companie with idCompanie
    router.patch("/lanceurs/:id", auth, lanceurs.update);

    // Delete a companie with idCompanie
    router.delete("/lanceurs/:id", auth, lanceurs.delete);

};
