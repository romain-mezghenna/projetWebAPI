const {
    sql
} = require("./db")

class Companies {
    constructor(id, nom) {
        this.idCompanie = id
        this.nomCompanie = nom
    }

    /**
     * Fetch all the users from the database
     * @returns Promise
     */
    static selectAll() {
        return new Promise((resolve, reject) => {
            sql.query("SELECT idCompanie FROM Companies", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                let companies = [];
                res.forEach((entry) => {
                    companies.push(Companies.selectById(entry.idCompanie));
                });
                Promise.all(companies)
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
            sql.query(`SELECT * FROM Companies WHERE idCompanie = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                if (res.length > 0) {
                    let astre = new Companies(res[0].idCompanie, res[0].nomCompanie);
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
                    Companies ( 
                    nomCompanie) VALUES (?)`, 
                    [obj.nomCompanie], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }

    /**
     * Update a companie in the database
     * @param id id of the companie to update
     * @param obj JSON object of the new attributes of the companie
     * @returns Promise
     */
    static update(id, obj) {
        return new Promise((resolve, reject) => {
            let query = "UPDATE `Companies` SET ";
            Object.keys(obj).forEach((key) => {
                query += `${key} = ${sql.escape(obj[key])},`;
            });
            query = query.slice(0, -1);
            query += ` WHERE idCompanie = ${sql.escape(id)}`;
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
     * Delete given companie from the database
     * @param id id of companie to delete
     * @returns Promise
     */
    static delete(id) {
        return new Promise((resolve, reject) => {
            sql.query("DELETE FROM `Companies` WHERE idCompanie = ? ", [id], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
}

exports.Companies = Companies