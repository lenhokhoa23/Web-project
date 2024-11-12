// models/Children.js
const db = require('../config/db');

class Children {
    // Lấy tất cả trẻ em
    static getAllChildren(callback) {
        const query = `
            SELECT c.Employee_ID, c.EmployeeName, c.ChildrenName, c.Gender, e.Department_ID
            FROM children c
            LEFT JOIN employee e ON e.Employee_ID = c.Employee_ID
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    // Tìm trẻ em theo ID
    static getChildrenById(id, callback) {
        const query = 'SELECT * FROM children WHERE Employee_ID = ?';
        db.query(query, [id], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results[0]);
        });
    }

    // Thêm trẻ em mới
    static createChild(childrenData, callback) {
        const query = 'INSERT INTO children SET ?';
        db.query(query, childrenData, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
}

module.exports = Children;