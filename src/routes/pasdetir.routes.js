module.exports = (router) => {
    const pasdetir = require("../controllers/pasdetir.controller.js");
    const {
        auth
    } = require("../middlewares/auth.middleware")

    // Create a new companie
    router.post("/pasdetir", auth, pasdetir.save);

    // Retrieve all pasdetir
    router.get("/pasdetir", auth, pasdetir.findAll);

    // Retrieve a single companie with idCompanie
    router.get("/pasdetir/:id", auth, pasdetir.findOneId);

    // Update a companie with idCompanie
    router.patch("/pasdetir/:id", auth, pasdetir.update);

    // Delete a companie with idCompanie
    router.delete("/pasdetir/:id", auth, pasdetir.delete);

};
