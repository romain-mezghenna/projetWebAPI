const {
    sql
} = require("./db")

class Pays {
    constructor(id, nomPays) {
        this.idPays = id
        this.nomPays = nomPays
    }

    /**
     * Fetch all the Pays from the database
     * @returns Promise
     */
    static selectAll() {
        return new Promise((resolve, reject) => {
            sql.query("SELECT idPays FROM Pays", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                let pays = [];
                res.forEach((entry) => {
                    pays.push(Pays.selectById(entry.idPays));
                });
                Promise.all(pays)
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
            sql.query(`SELECT * FROM Pays WHERE idPays = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                if (res.length > 0) {
                    let astre = new Pays(res[0].idPays, res[0].nomPays);
                    return resolve(astre);
                } else {
                    return reject(404);
                }
            });
        });
    }
}
exports.Pays = Pays