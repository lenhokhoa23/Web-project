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
        const query = `SELECT e.Employee_ID, e.EmployeeName, e.StartDate, e.Department_ID,
                    c.PhoneNumber, c.Email, c.EmployeeAddress
                    FROM employee e
                    LEFT JOIN employeecontact c ON e.Employee_ID = c.Employee_ID
                    WHERE e.Employee_ID = ?`;
        db.query(query, [id], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results[0]);
        });
    }

    // Thêm nhân viên mới
    static createEmployee(employeeData, callback) {
        const { Department_ID, EmployeeName, StartDate, Email, EmployeeAddress, PhoneNumber } = employeeData; // Loại bỏ ReportTo vì đã cố định
    
        const query = `
            INSERT INTO employee (Department_ID, EmployeeName, ReportTo, StartDate)
            VALUES (?, ?, 9, ?);
    
            SET @last_id = LAST_INSERT_ID();
    
            INSERT INTO employeecontact (Employee_ID, Email, EmployeeAddress, PhoneNumber)
            VALUES (@last_id, ?, ?, ?);
    
            INSERT INTO employeeperformance (Employee_ID, Comment, Score)
            VALUES (@last_id, NULL, 80);
        `;
    
        // Loại bỏ ReportTo khỏi values vì nó đã cố định là 9 trong câu lệnh SQL
        const values = [Department_ID, EmployeeName, StartDate, Email, EmployeeAddress, PhoneNumber];
    
        db.query(query, values, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
    

    // Tìm nhân viên điểm 10
    
}

module.exports = Employee;