const {
    sql
} = require("./db")

class Ville {
    constructor(id, nomVille, idPays) {
        this.idVille = id
        this.nomVille = nomVille
        this.idPays = idPays
    }

    /**
     * Fetch all the Ville from the database
     * @returns Promise
     */
    static selectAll() {
        return new Promise((resolve, reject) => {
            sql.query("SELECT idVille FROM Ville", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                let ville = [];
                res.forEach((entry) => {
                    ville.push(Ville.selectById(entry.idVille));
                });
                Promise.all(ville)
                    .then((data) => {
                        resolve(data);
                    })
                    .catch((err) => {
                        return reject(err);
                    });
            });
        });
    }

    /**
     * Fetch a vol
     * @param id Id of the vol to fetch
     * @returns Promise
     */
    static selectById(id) {
        id = sql.escape(id)
        return new Promise((resolve, reject) => {
            sql.query(`SELECT * FROM Ville WHERE idVille = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                if (res.length > 0) {
                    let astre = new Ville(res[0].idVille,res[0].nomVille,res[0].idPays);
                    return resolve(astre);
                } else {
                    return reject(404);
                }
            });
        });
    }

    /**
     *
     * @param obj JSON of all the attributes of the object and their values
     * nom, prenom, mail, pwd, tel, nomVille, idPays
     * @return void
     */
    static save(obj) {
        return new Promise((resolve, reject) => {
            sql.query("INSERT INTO `Ville`(`nomVille`,`idPays`) VALUES (?,?)",
                [obj.nomVille, obj.idPays], (err, res) => {
                    if (err) {
                        console.error("Error " + err);
                        return reject(err);
                    }
                    resolve(res);
                });
        });
    }

    /**
     * Update a Vol in the database
     * @param id id of the Vol to update
     * @param obj JSON object of the new attributes of the Vol
     * @returns Promise
     */
    static update(id, obj) {
        return new Promise((resolve, reject) => {
            let query = "UPDATE `Ville` SET ";
            Object.keys(obj).forEach((key) => {
                query += `${key} = ${sql.escape(obj[key])},`;
            });
            query = query.slice(0, -1);
            query += ` WHERE idVille = ${sql.escape(id)}`;
            sql.query(query, (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
    /**
     * Delete given Vol from the database
     * @param id id of Vol to delete
     * @returns Promise
     */
    static delete(id) {
        return new Promise((resolve, reject) => {
            sql.query("DELETE FROM `Ville` WHERE idVille = ? ", [id], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
}

exports.Ville = Ville