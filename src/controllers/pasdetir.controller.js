const {
    PasDeTir
} = require("../models/pasdetir.model");

exports.findAll = (req, res) => {
    if (!req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        PasDeTir.selectAll()
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
        PasDeTir.selectById(parseInt(req.params.id))
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
    if (!req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        PasDeTir.save(req.body, false)
            .then(() => {
                res.status(201).send({
                    results: true,
                    Message: "PasDeTir saved",
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

exports.update = (req, res) => {
    if (!req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        PasDeTir.update(req.params.id, req.body)
            .then(() => {
                res.status(200).send({
                    results: true,
                    Message: "PasDeTir updated",
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
    if (!req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
        PasDeTir.delete(req.params.id)
            .then(() => {
                res.status(200).send({
                    results: true,
                    Message: "PasDeTir deleted",
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
