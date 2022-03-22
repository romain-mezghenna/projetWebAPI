module.exports = (router) => {
    const auth = require("../controllers/auth.controller.js");
    //route for creating the token

    router.post('/login',auth.createToken)
};
