const jwt = require('jsonwebtoken');
const {Users} = require('../models/users.model');

async function auth(req, res, next) {
    try {
        const headers = req.headers;
        
        if (!headers || !headers.authorization) {
            return res.status(401).json({
                results : false,
                message: 'Missing Authorization header'
            });
        }
        const [scheme, token] = headers.authorization.split(' ');

        if (!scheme || scheme.toLowerCase() !== 'bearer' || !token) {
            return res.status(401).json({
                results: false,
                message: 'Header format is Authorization: Bearer token'
            });
        }
        const decodedToken = jwt.verify(token, process.env.JWT_SECRET_KEY);

        const userToken = decodedToken;
        const userDatabase = await Users.selectById(userToken.idUser)

        if (!userDatabase || !userToken) {
            return res.status(401).json({
                results: false,
                message: `User ${userId} not exists`
            });
        }

        // instead of using the userToken, prefer use userDatabase this provides extra security in case of 
        // someone puts "true" at isAdmin attribute in the localStorage/token in the front
        req.authUser = userDatabase;

        return next();
    } catch (err) {
        return res.status(401).json({
            results: false,
            message: 'Invalid token : ' + err
        });
    }
}

exports.auth = auth