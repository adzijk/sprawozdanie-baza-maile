const mysql = require('mysql2');

const link = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'cmsusers'
});

link.connect((err) => {
    if (err) throw err;
});

function readAll(table) {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * FROM ${table}`;
        link.query(sql, (error, result) => {
            if (error) {
                reject(error);
            } else {
                resolve(result);
            }
        });
    });
}

function read(email) {
    return new Promise((resolve, reject) => {
      const sql = "SELECT name FROM cmsUsers WHERE email = ?";
      link.query(sql, [email], (error, result) => {
        if (error) {
          reject(error);
        } else {
          resolve(result);
        }
      });
    });
  }

module.exports = { readAll, read };