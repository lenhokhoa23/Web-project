const db = require('../config/db');

class Project {
    static getAllProjects(callback) {
        const query = `
            SELECT p.Project_ID, p.ProjectName, p.Address, 
               c.ContractDate, c.ContractDue, c.Customer_ID, 
               cu.CustomerName
            FROM project p
            JOIN contract c ON p.Project_ID = c.Project_ID
            JOIN customer cu ON c.Customer_ID = cu.Customer_ID
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
    static getExpireProjects(callback) {
        const query = `
            SELECT p.Project_ID, p.ProjectName, p.Address, 
               c.ContractDate, c.ContractDue, c.Customer_ID, 
               cu.CustomerName
            FROM project p
            JOIN contract c ON p.Project_ID = c.Project_ID
            JOIN customer cu ON c.Customer_ID = cu.Customer_ID
            WHERE c.ContractDue < CURRENT_DATE()
        `
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
}

module.exports = Project;