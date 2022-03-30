module.exports = (router) => {
    const astres = require("../controllers/astres.controller.js");
    const {
        auth
    } = require("../middlewares/auth.middleware")

    // Users :

    // Create a new astre
    // Doen't
    router.post("/astres",auth, astres.save); 

    // Retrieve all astres
    router.get("/astres",astres.findAll); 

    // Retrieve a single astre with idAstre
    router.get("/astres/:id",astres.findOneId);

    // Update a astre with idAstre
    router.patch("/astres/:id", auth, astres.update);

    // Delete a astre with idAstre
    router.delete("/astres/:id", auth, astres.delete);

};
