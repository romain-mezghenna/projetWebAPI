const {
    sql
} = require("./db")

class Lanceurs {
    constructor(id, nom, idCompanie, imageurl) {
        this.idLanceur = id
        this.nomLanceur = nom
        this.idCompanie = idCompanie
        this.image = imageurl
    }

    /**
     * Fetch all the users from the database
     * @returns Promise
     */
    static selectAll() {
        return new Promise((resolve, reject) => {
            sql.query("SELECT idLanceur FROM Lanceurs", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                let lanceurs = [];
                res.forEach((entry) => {
                    lanceurs.push(Lanceurs.selectById(entry.idLanceur));
                });
                Promise.all(lanceurs)
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
            sql.query(`SELECT * FROM Lanceurs WHERE idLanceur = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                if (res.length > 0) {
                    let astre = new Lanceurs(res[0].idLanceur, res[0].nomLanceur,res[0].idLanceur,res[0].image);
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
            sql.query(`INSERT INTO 
                    Lanceurs ( 
                    nomLanceur,
                    idCompanie,
                    image) VALUES (?,?,?)`,
                [obj.nomLanceur,obj.idCompanie,obj.image], (err, res) => {
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
            let query = "UPDATE `Lanceurs` SET ";
            Object.keys(obj).forEach((key) => {
                query += `${key} = ${sql.escape(obj[key])},`;
            });
            query = query.slice(0, -1);
            query += ` WHERE idLanceur = ${sql.escape(id)}`;
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
            sql.query("DELETE FROM `Lanceurs` WHERE idLanceur = ? ", [id], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
}

exports.Lanceurs = Lanceurs