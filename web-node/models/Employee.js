// models/Employee.js
const db = require('../config/db');

class Employee {
    // Lấy tất cả nhân viên
    static getAllEmployees(callback) {
        const query = `
            SELECT e.Employee_ID, e.EmployeeName, e.StartDate, e.Department_ID,
                   c.PhoneNumber, c.Email, c.EmployeeAddress
            FROM employee e
            LEFT JOIN employeecontact c ON e.Employee_ID = c.Employee_ID
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    // Tìm nhân viên theo ID
    static getEmployeeById(id, callback) {
        const query = 'SELECT * FROM employee WHERE Employee_ID = ?';
        db.query(query, [id], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results[0]);
        });
    }

    // Thêm nhân viên mới
    static createEmployee(employeeData, callback) {
        const query = 'INSERT INTO employee SET ?';
        db.query(query, employeeData, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
}

module.exports = Employee;