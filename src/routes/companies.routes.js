module.exports = (router) => {
    const companies = require("../controllers/companies.controller.js");
    const {
        auth
    } = require("../middlewares/auth.middleware")

    // Create a new companie
    router.post("/companies", auth, companies.save);

    // Retrieve all companies
    router.get("/companies", auth, companies.findAll);

    // Retrieve a single companie with idCompanie
    router.get("/companies/:id", auth, companies.findOneId);

    // Update a companie with idCompanie
    router.patch("/companies/:id", auth, companies.update);

    // Delete a companie with idCompanie
    router.delete("/companies/:id", auth, companies.delete);

};
