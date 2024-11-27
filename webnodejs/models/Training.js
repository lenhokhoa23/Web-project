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

    static addTraining(trainingData, callback) {
        const { TrainingName, StartDate, EndDate, Employee_ID } = trainingData;
            const findNextTrainingIdQuery = `
            SELECT t1.Training_ID + 1 AS next_id
            FROM training t1
            LEFT JOIN training t2 ON t1.Training_ID + 1 = t2.Training_ID
            WHERE t2.Training_ID IS NULL
            ORDER BY t1.Training_ID DESC
            LIMIT 1;
        `;
        
        db.query(findNextTrainingIdQuery, (err, rows) => {
            if (err) {
                console.error('Lỗi khi tìm ID tiếp theo cho đào tạo:', err);
                return callback(err, null);
            }
    
            let nextTrainingId = rows.length > 0 ? rows[0].next_id : 1; 

            const query = `
                INSERT INTO training (Training_ID, TrainingName, StartDate, EndDate, Employee_ID) VALUES (?, ?, ?, ?, ?);
            `;
            
            db.query(query, [nextTrainingId, TrainingName, StartDate, EndDate, Employee_ID], (err, result) => {
                if (err) {
                    console.error('Lỗi khi thêm dự án vào bảng training:', err);
                    return callback(err, null);
                }
                callback(null, result);
            });
        });
    }
}

module.exports = Training;