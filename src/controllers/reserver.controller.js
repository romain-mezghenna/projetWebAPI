const {
    Reserver
} = require("../models/Reserver.model");

exports.findAll = (req, res) => {
    if (!req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        Reserver.selectAll()
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

exports.findAllidUser = (req, res) => {
    if ((req.authUser.idUser != req.params.id) && !req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        Reserver.selectByidUser(parseInt(req.params.id))
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

exports.findAllidVol = (req, res) => {
    if ((req.authUser.idUser != req.params.id) && !req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        Reserver.selectByidVol(parseInt(req.params.id))
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

exports.save = (req, res) => {
    if ((req.authUser.idUser != req.body.idUser) && !req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        req.body.idUser = req.authUser.idUser
        Reserver.save(req.body, false)
            .then(() => {
                res.status(201).send({
                    results: true,
                    Message: "Reservation saved",
                });
                let ip = (
                    req.headers["x-forwarded-for"] || req.connection.remoteAddress
                ).split(":")[3];
                console.log("Connection from : " + ip);
            })
            .catch((err) => {
                res.status(500).send({
                    results: false,
                    Error_Message: err.message || "An error occured",
                });
            });
    }
};



exports.delete = (req, res) => {
    if ((req.authUser.idUser != req.body.idUser) && !req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        req.body.idUser = req.authUser.idUser
        Reserver.delete(req.body)
            .then(() => {
                res.status(200).send({
                    results: true,
                    Message: "Reservation deleted",
                });
                let ip = (
                    req.headers["x-forwarded-for"] || req.connection.remoteAddress
                ).split(":")[3];
                console.log("Connection from : " + ip);
            })
            .catch((err) => {
                res.status(500).send({
                    results: false,
                    Error_Message: err.message || "An error occured",
                });
            });
    }
};
