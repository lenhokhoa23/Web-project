const db = require('../config/db');

class Employee {
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

    static createEmployee(employeeData, callback) {
        const { Department_ID, EmployeeName, StartDate, Email, EmployeeAddress, PhoneNumber } = employeeData;
    
        const query = `
            INSERT INTO employee (Department_ID, EmployeeName, ReportTo, StartDate)
            VALUES (?, ?, 9, ?);
    
            SET @last_id = LAST_INSERT_ID();
    
            INSERT INTO employeecontact (Employee_ID, Email, EmployeeAddress, PhoneNumber)
            VALUES (@last_id, ?, ?, ?);
    
            INSERT INTO employeeperformance (Employee_ID, EmployeeName, Comment, Score)
            VALUES (@last_id, ?, 'Tốt', 80);

            INSERT INTO timesheet (Employee_ID, EmployeeName, WorkedHours)
            VALUES (@last_id, ?, 0);
        `;
    
        const values = [Department_ID, EmployeeName, StartDate, Email, EmployeeAddress, PhoneNumber, EmployeeName, EmployeeName, EmployeeName];
    
        db.query(query, values, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
    static deleteEmployee(id, callback) {
        const query = `
            DELETE FROM timesheet WHERE Employee_ID = ?;
            DELETE FROM employeeperformance WHERE Employee_ID = ?;
            DELETE FROM employeecontact WHERE Employee_ID = ?;
            DELETE FROM employee WHERE Employee_ID = ?;
        `;
        
        db.query(query, [id, id, id, id, id], (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
    
}

module.exports = Employee;