const db = require('../config/db');

class Product {
    // Lấy tất cả sản phẩm với số lượng đơn hàng và tên nhà cung cấp
    static getAllProducts(callback) {
        const query = `
            SELECT 
                p.Product_ID, 
                p.Product_Code, 
                COUNT(o.Order_ID) AS OrderCount, 
                s.SupplierName 
            FROM product p
            LEFT JOIN orderdetails o ON p.Product_Code = o.Product_Code
            LEFT JOIN supplier s ON p.Supplier_ID = s.Supplier_ID
            GROUP BY p.Product_ID, p.Product_Code, s.SupplierName
        `;
        
        db.query(query, (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results);
        });
    }

    // Lấy thông tin sản phẩm theo ID
    static getProductById(productId, callback) {
        const query = `
            SELECT 
                p.Product_ID, 
                p.Product_Code, 
                COUNT(o.Order_ID) AS OrderCount, 
                s.SupplierName 
            FROM product p
            LEFT JOIN orderdetails o ON p.Product_Code = o.Product_Code
            LEFT JOIN supplier s ON p.Supplier_ID = s.Supplier_ID
            WHERE p.Product_ID = ?
            GROUP BY p.Product_ID, p.Product_Code, s.SupplierName
        `;
        
        db.query(query, [productId], (err, results) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, results[0]);
        });
    }

    // Thêm sản phẩm mới
    static createProduct(productData, callback) {
        const query = 'INSERT INTO product SET ?';
        db.query(query, productData, (err, result) => {
            if (err) {
                return callback(err, null);
            }
            callback(null, result);
        });
    }
}

module.exports = Product;
