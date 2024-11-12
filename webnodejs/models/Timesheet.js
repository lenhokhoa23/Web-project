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
}

module.exports = Timesheet;
