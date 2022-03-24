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
    require('./astres.routes')(router)
    require('./companies.routes')(router)
    require('./lanceurs.routes')(router)
    require('./pasdetir.routes')(router)
    require('./vols.routes')(router)
    require('./villes.routes')(router)
    require('./pays.routes')(router)
    require('./reserver.routes')(router)
}