const {
    Users
} = require("../models/users.model");
const jwt = require('jsonwebtoken')

exports.createToken = async (req,res) => {
    try {
        const {mail, password} = req.body

        if (!mail) {
            return res.status(400).json({
                results: false,
                message: 'missing_required_parameter_mail'
            });
        }

        if (!password) {
            return res.status(400).json({
                results: false,
                message: 'missing_required_parameter_password'
            });
        }

        const user = await Users.login(mail, password);
        // if the user isn't in the DB
        if (!user) {
            return res.status(401).json({
                results : false,
                message: 'Username or password is incorrect'
            });
        }
        
        const accessToken = jwt.sign(
        {
            idUser : user.idUser,
            isAdmin : user.isAdmin
        },
        process.env.JWT_SECRET_KEY,
        {
            expiresIn : '100h',
            subject: user.idUser.toString()
        })

        return res.status(200).json({
            accessToken,
            results : true,
            user
        })
    } catch (err) {
        return res.status(500).json({
            results : false,
            message: 'Internal server error'
        });
    }
}