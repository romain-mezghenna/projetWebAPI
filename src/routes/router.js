// Load all the routes
module.exports = router => {

    // simple route
    router.get("/", (req, res) => {
        res.json({
            message: "Welcome to projetWeb API."
        });
    });

    // Get All the routers

    require('./users.routes')(router)
    require('./auth.routes')(router)
}