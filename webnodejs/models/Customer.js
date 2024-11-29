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

    static getCustomerDept(callback) {
        const query = `SELECT c.Customer_ID, c.CustomerName, (COALESCE((SELECT SUM(od.Quantity * od.PriceEach) FROM orderdetails od
                                       WHERE od.Order_ID in (SELECT o.Order_ID FROM orders o
                                                          WHERE o.Customer_ID = c.Customer_ID)), 0)
                                       - COALESCE((SELECT SUM(amount) FROM payment
                                        WHERE customer_ID = c.Customer_ID), 0)) AS totalDept FROM customer c
                                        ORDER BY totalDept DESC
                                        ;`;
        db.query(query, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
}

module.exports = Customer;