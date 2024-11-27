const db = require('../config/db');

class Payment {
    static getAllPayments(callback) {
        const query = `
            SELECT p.checkNumber, p.customer_ID, c.CustomerName, c.CustomerEmail, p.amount, p.paymentDate 
            FROM payment p
            LEFT JOIN customer c ON c.Customer_ID = p.customer_ID
        `;
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static getPaymentsByCustomerId(customerId, callback) {
        const query = `
            SELECT p.checkNumber, p.customer_ID, c.CustomerName, c.CustomerEmail, p.amount, p.paymentDate 
            FROM payment p
            LEFT JOIN customer c ON c.Customer_ID = p.customer_ID
            where p.customer_ID = ?
        `;
        db.query(query, [customerId], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
    

    
}

module.exports = Payment;
