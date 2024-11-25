// models/Feedback.js
const db = require('../config/db');

class Feedback {
    /**
     * Lấy tất cả phản hồi
     */
    static getAllFeedbacks(callback) {
        const query = `
            SELECT f.Feedback_ID, f.Customer_ID, c.CustomerName, f.Order_ID, f.Rating, f.Comments
            FROM feedback f
            LEFT JOIN customer c ON c.Customer_ID = f.Customer_ID
        `;
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    // Lấy Feedback bằng customerId
    static getFeedbacksByCustomerId(customerId, callback) {
        const query = 'SELECT * FROM feedback WHERE Customer_ID = ?';
        db.query(query, [customerId], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
    
    // Lấy Feedback bằng điểm số (Rating)
    static getFeedbacksByRating(rating, callback) {
        const query = 'SELECT * FROM feedback WHERE Rating = ?';
        db.query(query, [rating], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
    
}

module.exports = Feedback;
