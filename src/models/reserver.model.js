const {
    sql
} = require("./db")

class Reserver {
    constructor(user,vol) {
        this.idUser = user
        this.idVol = vol
    }

    /**
     * Fetch all the Reserver from the database
     * @returns Promise
     */
    static selectAll() {
        return new Promise((resolve, reject) => {
            sql.query("SELECT * FROM Reserver", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                resolve(res)
            });
        });
    }

    /**
     * Fetch a vol
     * @param id Id of the vol to fetch
     * @returns Promise
     */
    static selectByidUser(id) {
        id = sql.escape(id)
        return new Promise((resolve, reject) => {
            sql.query(`SELECT * FROM Reserver WHERE idUser = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                resolve(res)
            });
        });
    }

    /**
     * Fetch a vol
     * @param id Id of the vol to fetch
     * @returns Promise
     */
    static selectByidVol(id) {
        id = sql.escape(id)
        return new Promise((resolve, reject) => {
            sql.query(`SELECT * FROM Reserver WHERE idVol = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                resolve(res)
            });
        });
    }

    /**
     *
     * @param obj JSON of all the attributes of the object and their values
     * nom, prenom, mail, pwd, tel, nomReserver, idPays
     * @return void
     */
    static save(obj) {
        return new Promise((resolve, reject) => {
            sql.query("INSERT INTO `Reserver`(`idUser`,`idVol`) VALUES (?,?)",
                [obj.idUser, obj.idVol], (err, res) => {
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
    static delete(obj) {
        return new Promise((resolve, reject) => {
            sql.query("DELETE FROM `Reserver` WHERE idUser = ? AND idVol = ? ", [obj.idUser,obj.idVol], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
}

exports.Reserver = Reserver