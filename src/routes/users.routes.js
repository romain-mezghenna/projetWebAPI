module.exports = (router) => {
    const users = require("../controllers/users.controller.js");
    const {auth} = require("../middlewares/auth.middleware")

    // Users :

    // Create a new user
    // Doen't need authentification => sign in 
    router.post("/users", users.save); // curl -i -X POST -H  "Content-type: application/json" -d '{"nomUser":"Lucas","prenomUser":"Dantzer","mail" : "tqtjsuisbonenskate@flip.géplusdegenou","password" : "aieaieaie", "tel" : "0697979797", "nomVille":"Bordeaux", "idPays":1}' localhost:9999/users

    // Retrieve all users
    router.get("/users",auth, users.findAll); // http://localhost:3000/users

    // Retrieve a single user with userid
    router.get("/users/:id",auth, users.findOneId); // http://localhost:3000/users/1

    // Update a user with userid
    router.patch("/users/:id",auth, users.update); // curl -i -X PATCH -H "Content-type: application/json" -d '{"email" : "jeanney@gmail.fr","password" : "azertyaie","isArtist" : "0"}' localhost:3000/users/3

    // Delete a user with userid
    router.delete("/users/:id",auth, users.delete); // curl -i -X DELETE localhost:3000/users/4

};
