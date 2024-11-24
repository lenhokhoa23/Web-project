// config/db.js
const mysql = require('mysql2');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'company_sample',
    port: 3306,
    multipleStatements: true
});

db.connect((err) => {
    if (err) {
        console.error('Lỗi kết nối database:', err.stack);
        return;
    }
    console.log('Kết nối database thành công với ID ' + db.threadId);
});

module.exports = db;