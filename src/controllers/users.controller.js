const {
    Users
} = require("../models/users.model");

exports.findAll = (req, res) => {
    if(!req.authUser.isAdmin){
        res.status(401).send({
            results: false,
            Message : "You're not an administrator",
        })
    } else {
    Users.selectAll()
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
    if ((req.authUser.idUser != req.params.id) && !req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
    console.log(`SELECT USER ${req.params.id} : ${req.ip}`);
    Users.selectById(parseInt(req.params.id))
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
    Users.save(req.body, false)
        .then(() => {
            res.status(201).send({
                results: true,
                Message: "User saved",
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
};

exports.update = (req, res) => {
    if ((req.authUser.idUser != req.params.id) && !req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
    Users.update(req.params.id, req.body)
        .then(() => {
            res.status(200).send({
                results: true,
                Message: "User updated",
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
    if ((req.authUser.idUser != req.params.id) && !req.authUser.isAdmin) {
        res.status(401).send({
            results: false,
            Message: "You're not an administrator",
        })
    } else {
    Users.delete(req.params.id)
        .then(() => {
            res.status(200).send({
                results: true,
                Message: "User deleted",
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
