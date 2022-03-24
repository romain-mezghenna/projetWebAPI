const {
    sql
} = require("./db")

class Vols {
    constructor(id, date, heureDepart,duree, description,idAstre,prix,idPas) {
        this.idVol = id
        this.date = date
        this.heureDepart = heureDepart
        this.duree = duree
        this.description = description
        this.idAstre = idAstre
        this.prix = prix
        this.idPas = idPas
    }

    /**
     * Fetch all the vols from the database
     * @returns Promise
     */
    static selectAll() {
        return new Promise((resolve, reject) => {
            sql.query("SELECT idVol FROM Vols", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                let vols = [];
                res.forEach((entry) => {
                    vols.push(Vols.selectById(entry.idVol));
                });
                Promise.all(vols)
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
            sql.query(`SELECT * FROM Vols WHERE idVol = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                if (res.length > 0) {
                    let astre = new Vols(res[0].idVol, res[0].date, res[0].heureDepart, res[0].duree, res[0].description, res[0].idAstre, res[0].prix, res[0].idPas);
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
            sql.query("INSERT INTO `Vols`(`date`, `heureDepart`, `duree`, `description`, `idAstre`, prix`, `idPas`) " +
                        "VALUES (?,?,?,?,?,?,?)",
                [obj.date, obj.heureDepart, obj.duree, obj.description, obj.idAstre, obj.prix, obj.idPas], (err, res) => {
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
            let query = "UPDATE `Vols` SET ";
            Object.keys(obj).forEach((key) => {
                query += `${key} = ${sql.escape(obj[key])},`;
            });
            query = query.slice(0, -1);
            query += ` WHERE idVol = ${sql.escape(id)}`;
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
            sql.query("DELETE FROM `Vols` WHERE idVol = ? ", [id], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
}

exports.Vols = Vols