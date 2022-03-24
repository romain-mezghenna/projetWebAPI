const {
    sql
} = require("./db")

class PasDeTir {
    constructor(id, nom, idVille) {
        this.idPas = id
        this.nomPas = nom
        this.idVille = idVille
    }

    /**
     * Fetch all the users from the database
     * @returns Promise
     */
    static selectAll() {
        return new Promise((resolve, reject) => {
            sql.query("SELECT idPas FROM PasDeTir", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                let pasdetir = [];
                res.forEach((entry) => {
                    pasdetir.push(PasDeTir.selectById(entry.idPas));
                });
                Promise.all(pasdetir)
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
     * Fetch a user
     * @param id Id of the user to fetch
     * @returns Promise
     */
    static selectById(id) {
        id = sql.escape(id)
        return new Promise((resolve, reject) => {
            sql.query(`SELECT * FROM PasDeTir WHERE idPas = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                if (res.length > 0) {
                    let pasdetir = new PasDeTir(res[0].idPas, res[0].nomPas, res[0].idVille);
                    return resolve(pasdetir);
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
            sql.query(`INSERT INTO 
                    PasDeTir ( 
                    nomPas,
                    idVille) VALUES (?,?)`,
                [obj.nomPas, obj.idVille], (err, res) => {
                    if (err) {
                        console.error("Error " + err);
                        return reject(err);
                    }
                    resolve(res);
                });
        });
    }

    /**
     * Update a Lanceur in the database
     * @param id id of the Lanceur to update
     * @param obj JSON object of the new attributes of the Lanceur
     * @returns Promise
     */
    static update(id, obj) {
        return new Promise((resolve, reject) => {
            let query = "UPDATE `PasDeTir` SET ";
            Object.keys(obj).forEach((key) => {
                query += `${key} = ${sql.escape(obj[key])},`;
            });
            query = query.slice(0, -1);
            query += ` WHERE idPas = ${sql.escape(id)}`;
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
     * Delete given Lanceur from the database
     * @param id id of Lanceur to delete
     * @returns Promise
     */
    static delete(id) {
        return new Promise((resolve, reject) => {
            sql.query("DELETE FROM `PasDeTir` WHERE idPas = ? ", [id], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
}

exports.PasDeTir = PasDeTir