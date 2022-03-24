const {
    sql
} = require("./db")

class Astres {
    constructor(id, nom, description,imageurl) {
        this.idAstre = id
        this.nomAstre = nom
        this.description = description
        this.image = imageurl
    }

    /**
     * Fetch all the users from the database
     * @returns Promise
     */
    static selectAll() {
        return new Promise((resolve, reject) => {
            sql.query("SELECT idAstre FROM Astres", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                let astres = [];
                res.forEach((entry) => {
                    astres.push(Astres.selectById(entry.idAstre));
                });
                Promise.all(astres)
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
            sql.query(`SELECT * FROM Astres WHERE idAstre = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                if (res.length > 0) {
                    let astre = new Astres(res[0].idAstre,res[0].nomAstre,res[0].description,res[0].image);
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
                    Astres ( 
                    nomAstre,
                    description,
                    image) VALUES (?,?,?)`, [
                obj.nomAstre,
                obj.description,
                obj.image
            ], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }

    /**
     * Update a user in the database
     * @param id id of the user to update
     * @param obj JSON object of the new attributes of the user
     * @returns Promise
     */
    static update(id, obj) {
        return new Promise((resolve, reject) => {
            let query = "UPDATE `Astres` SET ";
            Object.keys(obj).forEach((key) => {
                query += `${key} = ${sql.escape(obj[key])},`;
            });
            query = query.slice(0, -1);
            query += ` WHERE idAstre = ${sql.escape(id)}`;
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
     * Delete given user from the database
     * @param id id of user to delete
     * @returns Promise
     */
    static delete(id) {
        return new Promise((resolve, reject) => {
            sql.query("DELETE FROM `Astres` WHERE idAstre = ? ", [id], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
}

exports.Astres = Astres