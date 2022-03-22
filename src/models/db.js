const mysql = require("mysql");

const sql = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PWD,
    database: process.env.DB
});


// open the MySQL connection

sql.connect(error => {
    if (error) throw (error);
    console.log("Successfully connected to the database.");
});

module.exports = {
    sql: sql,
    countTable: function (tableName) {
        return new Promise((resolve, reject) => {
            sql.query(`SELECT COUNT(*) as nb FROM ${tableName}`, (err, res) => {
                if (err) {
                    console.error('Error ' + err);
                    return reject(err);
                }
                resolve(res[0].nb)
            })
        })
    }
};