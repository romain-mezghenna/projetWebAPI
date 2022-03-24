module.exports = (router) => {
    const {auth} = require('../middlewares/auth.middleware')
    const reserver = require('../controllers/reserver.controller')
    //Get all the reservations 
    router.get("/reserver",auth,reserver.findAll)
    //Get all the reservations by an idUser 
    router.get("/reserver/user/:id",auth,reserver.findAllidUser)
    //Get all the reservations by an idVol
    router.get("/reserver/vol/:id",auth,reserver.findAllidVol)
    //Save an new reservation from an idUser
    router.post("/reserver",auth,reserver.save)
    //Delete a reservation
    router.delete("/reserver",auth,reserver.delete)
    
    
};
