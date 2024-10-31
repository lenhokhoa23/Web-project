const db = require('../config/db');

class Training {
    static getAllTraining(callback) {
        const query = `
            SELECT t.Training_ID, t.TrainingName, t.StartDate, t.EndDate, e.EmployeeName
            FROM training t
            JOIN employee e ON t.Employee_ID = e.Employee_ID
        `;
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
}

module.exports = Training;