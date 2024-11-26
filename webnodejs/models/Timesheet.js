const db = require('../config/db');

class Timesheet {
    static getAllTimeSheets(callback) {
        const query = `
        SELECT DISTINCT t.Employee_ID, t.EmployeeName, t.WorkedHours, 
                        p.score, p.comment
        FROM timesheet t
        LEFT JOIN employeeperformance p ON t.Employee_ID = p.Employee_ID
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static getPerfectScoreEmployees(callback) {
        const query = `
        SELECT DISTINCT t.Employee_ID, t.EmployeeName, t.WorkedHours, 
                        p.score, p.comment
        FROM timesheet t
        LEFT JOIN employeeperformance p ON t.Employee_ID = p.Employee_ID
        WHERE p.score = 10
        `;

        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static getHardEmployees(callback) {
        const query = `
        SELECT DISTINCT t.Employee_ID, t.EmployeeName, t.WorkedHours, 
                        p.score, p.comment
        FROM timesheet t
        LEFT JOIN employeeperformance p ON t.Employee_ID = p.Employee_ID
        ORDER BY t.WorkedHours desc
        LIMIT 10
        `;

        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
    static calculateTotalSalary(callback) {
        const query = `
            SELECT t.Employee_ID, t.EmployeeName, s.Salary, s.Bonus,
                   (s.Salary + COALESCE(s.Bonus, 0)) as TotalSalary
            FROM timesheet t
            JOIN salary s ON t.Employee_ID = s.Employee_ID
            GROUP BY t.Employee_ID
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static resetAllBonus(callback) {
        const query = `
            UPDATE salary SET Bonus = 0 WHERE Bonus IS NOT NULL
        `;
        
        db.query(query, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }

    static updateEmployeeBonus(employeeName, bonusAmount, callback) {
        const query = `
            UPDATE salary s
            JOIN employee e ON s.Employee_ID = e.Employee_ID
            SET s.Bonus = COALESCE(s.Bonus, 0) + ?
            WHERE e.EmployeeName = ?
        `;
        
        db.query(query, [bonusAmount, employeeName], (err, result) => {
            if (err) {
                return callback(err, null);
            }
            if (result.affectedRows === 0) {
                return callback(new Error('Employee not found or bonus not updated'), null);
            }
            callback(null, result);
        });
    }
    static calculateTotalPayroll(callback) {
        const query = `
            SELECT SUM(s.Salary + COALESCE(s.Bonus, 0)) as TotalPayroll
            FROM salary s
        `;
        
        db.query(query, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result[0].TotalPayroll);
        });
    }

    static updateBonusByDepartment(departmentId, bonusAmount, callback) {
        const query = `
            UPDATE salary s
            JOIN employee e ON s.Employee_ID = e.Employee_ID
            SET s.Bonus = COALESCE(s.Bonus, 0) + ?
            WHERE e.Department_ID = ?
        `;
        
        db.query(query, [bonusAmount, departmentId], (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }

    static updateEmployeeSalary(employeeId, newSalary, callback) {
        const query = `
            UPDATE salary
            SET Salary = ?
            WHERE Employee_ID = ?
        `;
        
        db.query(query, [newSalary, employeeId], (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }

    static updateWorkedHours(callback) {
        const query = `
            UPDATE timesheet t
            JOIN (
                SELECT Employee_ID, SUM(TIMESTAMPDIFF(HOUR, CheckIn, CheckOut)) as TotalHours
                FROM attendance
                WHERE CheckOut IS NOT NULL
                GROUP BY Employee_ID
            ) a ON t.Employee_ID = a.Employee_ID
            SET t.WorkedHours = a.TotalHours
        `;
        
        db.query(query, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }

    static updateSalaryBasedOnAttendance(callback) {
        const query = `
            UPDATE salary s
            JOIN (
                SELECT Employee_ID, 
                       (DaysOff * 50000 + LateDays * 20000) as DeductionAmount
                FROM salary
            ) a ON s.Employee_ID = a.Employee_ID
            SET s.Salary = s.Salary - a.DeductionAmount,
                s.DaysOff = 0,
                s.LateDays = 0
            WHERE a.DeductionAmount > 0
        `;
        
        db.query(query, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
}

module.exports = Timesheet;
