const db = require('../config/db');

class Product {
    static getAllProducts(callback) {
        const query = `
            SELECT 
                p.Product_ID, 
                p.Product_Code, 
                COUNT(o.Order_ID) AS OrderCount, 
                s.SupplierName,
                p.quantityInStock
            FROM product p
            LEFT JOIN orderdetails o ON p.Product_Code = o.Product_Code
            LEFT JOIN supplier s ON p.Supplier_ID = s.Supplier_ID
            GROUP BY p.Product_ID, p.Product_Code, s.SupplierName, p.quantityInStock
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }    

    static getProductById(productId, callback) {
        const query = `
            SELECT 
                p.Product_ID, 
                p.Product_Code, 
                COUNT(o.Order_ID) AS OrderCount, 
                s.SupplierName,
                p.quantityInStock
            FROM product p
            LEFT JOIN orderdetails o ON p.Product_Code = o.Product_Code
            LEFT JOIN supplier s ON p.Supplier_ID = s.Supplier_ID
            WHERE p.Product_ID = ?
            GROUP BY p.Product_ID, p.Product_Code, s.SupplierName, p.quantityInStock
        `;
        
        db.query(query, [productId], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results[0]);
        });
    }

    static addProduct(productData, callback) {
        const query = `
            INSERT INTO product (Product_Code, Supplier_ID, BuyPrice, ProductRating, QuantityInStock)
            VALUES (?, ?, ?, ?, ?)
        `;
        const { Product_Code, Supplier_ID, BuyPrice, ProductRating, QuantityInStock } = productData;

        db.query(query, [Product_Code, Supplier_ID, BuyPrice, ProductRating, QuantityInStock], (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
   
    static addSupplier(supplierData, callback) {
        const query = `
            INSERT INTO supplier (SupplierName, SupplierEmail, SupplierAddress)
            VALUES (?, ?, ?)
        `;
        const { SupplierName, SupplierEmail, SupplierAddress } = supplierData;

        db.query(query, [SupplierName, SupplierEmail, SupplierAddress], (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }  
}

module.exports = Product;
