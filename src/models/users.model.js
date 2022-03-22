const {sql} = require("./db")

class Users {
    constructor(id,nom,prenom,mail,isAdmin,tel,idVille){
        this.idUser=id
        this.nomUser=nom
        this.prenomUser=prenom
        this.mail=mail,
        this.tel=tel
        this.isAdmin = Boolean(isAdmin[0])
        this.idVille=idVille
    }

    /**
     * Fetch all the users from the database
     * @returns Promise
     */
    static selectAll() { 
        return new Promise((resolve, reject) => {
            sql.query("SELECT idUser FROM Users", (err, res) => {
                if (err) {
                    console.error("Error: " + err);
                    return reject(err);
                }
                let users = [];
                res.forEach((entry) => {
                    users.push(Users.selectById(entry.idUser));
                });
                Promise.all(users)
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
            sql.query(`SELECT * FROM Users WHERE idUser = ?
            `, [id], (err, res) => {
                if (err) {
                    console.error('Error' + err);
                    return reject(err);
                }
                if (res.length > 0) {
                    let user = new Users(res[0].idUser, res[0].nomUser, res[0].prenomUser, res[0].mail,res[0].isAdmin,res[0].tel,res[0].idVille);
                    return resolve(user);
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
            sql.query(`CALL addUser(?,?,?,?,?,?,?)`, [
                obj.nomUser,
                obj.prenomUser,
                obj.mail,
                obj.password,
                obj.tel,
                obj.nomVille,
                obj.idPays
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
           let query = "UPDATE `Users` SET ";
           Object.keys(obj).forEach((key) => {
               query += `${key} = ${sql.escape(obj[key])},`;
           }); 
           query = query.slice(0, -1);
           query += ` WHERE idUser = ${sql.escape(id)}`;
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
            sql.query("DELETE FROM `Users` WHERE idUser = ? ", [id], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                resolve(res);
            });
        });
    }
    /***
     * @param login
     * @param password
     * @returns true if the combinaison is found in the bd
     */
    static login(login, password){
        return new Promise(((resolve, reject) => {
            sql.query("SELECT * FROM `Users` WHERE mail = ? AND password = ? ", [login,password], (err, res) => {
                if (err) {
                    console.error("Error " + err);
                    return reject(err);
                }
                if(res.length > 0){
                   return resolve(new Users(res[0].idUser, res[0].nomUser, res[0].prenomUser, res[0].mail, res[0].isAdmin, res[0].tel, res[0].idVille))
                } else {
                    return resolve(false)
                }
            });
        }))
    }
}

exports.Users = Users