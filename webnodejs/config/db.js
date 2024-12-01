require('dotenv').config(); 




const mysql = require('mysql2');

const db = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: Number(process.env.DB_PORT), // Chuyển về số
    multipleStatements: process.env.DB_MULTIPLE_STATEMENTS === 'true' // Chuyển về boolean
});

db.connect((err) => {
    if (err) {
        console.error('Lỗi kết nối database:', err.stack);
        return;
    }
    console.log('Kết nối database thành công với ID ' + db.threadId);
});

module.exports = db;
