const {
    Pays
} = require("../models/pays.model");

exports.findAll = (req, res) => {
    if (!req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        Pays.selectAll()
            .then((data) => {
                res.status(200).send(data);
                let ip = req.headers["x-forwarded-for"] || req.connection.remoteAddress;
                console.log("Connection from : " + ip);
            })
            .catch((err) => {
                res.status(500).send({
                    results: false,
                    Error_Message: err.message || "An error occured.",
                });
            });
    }
};

exports.findOneId = (req, res) => {
    if (!req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        Pays.selectById(parseInt(req.params.id))
            .then((data) => {
                res.status(200).send(data).end();
                let ip = req.headers["x-forwarded-for"] || req.connection.remoteAddress;
                console.log("Connection from : " + ip);
            })
            .catch((err) => {
                res
                    .status(500)
                    .send({
                        results: false,
                        Error_Message: err.message || "An error occured",
                    })
                    .end();
            });
    }
};