const db = require('../config/db');

class Order {
    static getAllOrders(callback) {
        const query = `
            SELECT o.Order_ID, c.Customer_ID, c.CustomerName, o.OrderDate,
            o.OrderRequired, o.ShipAddress, o.ShippedDate, o.Status 
            FROM orders o 
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
            SELECT o.Order_ID, c.Customer_ID, SUM(od.Quantity * od.PriceEach) as totalValue 
            FROM orders o 
            JOIN customer c ON o.Customer_ID = c.Customer_ID 
            JOIN orderdetails od ON o.Order_ID = od.Order_ID 
            GROUP BY o.Order_ID
            ORDER BY totalValue DESC;
        `;
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static getOrdersByStatus(status, callback) {
        const query = `
            SELECT o.Order_ID, c.Customer_ID, c.CustomerName, o.OrderDate,
            o.OrderRequired, o.ShipAddress, o.ShippedDate, o.Status 
            FROM orders o 
            JOIN customer c ON o.Customer_ID = c.Customer_ID
            WHERE o.Status = ?
        `;
        
        db.query(query, [status], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
    static getOrdersNotShippedYet(callback) {
        const query = `
            SELECT o.Order_ID, c.Customer_ID, c.CustomerName, o.OrderDate,
            o.OrderRequired, o.ShipAddress, o.ShippedDate, o.Status 
            FROM orders o 
            JOIN customer c ON o.Customer_ID = c.Customer_ID
            WHERE o.Status <> 'Shipped'
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static getValueOfProduct(callback) {
        const query = `
            SELECT od.Product_Code, SUM(od.PriceEach * od.Quantity) as valueOfPro FROM orders o 
            JOIN orderdetails od ON o.Order_ID = od.Order_ID
            GROUP BY od.Product_Code
            ORDER BY valueOfPro DESC;

        `;
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static getOrderDetails(orderId, callback) {
        const query = `
            SELECT Order_ID, Product_Code, PriceEach, Quantity FROM orderdetails
            WHERE Order_ID = ?;
        `;
        
        db.query(query, [orderId], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    static getOrdersByDateRange(startDate, endDate, callback) {
        const query = `
            SELECT o.Order_ID, c.Customer_ID, c.CustomerName, o.OrderDate,
            o.OrderRequired, o.ShipAddress, o.ShippedDate, o.Status 
            FROM orders o 
            JOIN customer c ON o.Customer_ID = c.Customer_ID
            WHERE o.OrderDate BETWEEN ? AND ?
        `;
        
        db.query(query, [startDate, endDate], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }
    static getTotalRevenue(startDate, endDate, callback) {
        const query = `
            SELECT SUM(od.Quantity * od.PriceEach) as TotalRevenue
            FROM orders o
            JOIN orderdetails od ON o.Order_ID = od.Order_ID
            WHERE o.OrderDate BETWEEN ? AND ?
        `;
        
        db.query(query, [startDate, endDate], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results[0].TotalRevenue);
        });
    }

    static getTopCustomers(callback) {
        const query = `
            SELECT c.Customer_ID, c.CustomerName, SUM(od.Quantity * od.PriceEach) as TotalValue
            FROM customer c
            JOIN orders o ON c.Customer_ID = o.Customer_ID
            JOIN orderdetails od ON o.Order_ID = od.Order_ID
            GROUP BY c.Customer_ID
            ORDER BY TotalValue DESC
            LIMIT 5
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