const db = require('../config/db');

class Order {
    static getAllOrders(callback) {
        const query = `
            SELECT o.Order_ID, c.Customer_ID, c.CustomerName, o.OrderDate,
            o.OrderRequired, o.ShipAddress, o.ShippedDate, o.Status FROM orders o 
            JOIN customer c ON o.Customer_ID = c.Customer_ID
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
    static getValueOrders(callback) {
        const query = `
        `;
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

}
 
module.exports = Order;