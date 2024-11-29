const db = require('../config/db');

class Customer {
    static getAllCustomer(callback) {
        const query = `
            SELECT c.Customer_ID, c.CustomerName, c.CustomerEmail, c.Num_Order
            FROM customer c
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static getCustomerById(id, callback) {
        const query = 'SELECT * FROM customer WHERE Customer_ID = ?';
        db.query(query, [id], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results[0]);
        });
    }
}

module.exports = Customer;