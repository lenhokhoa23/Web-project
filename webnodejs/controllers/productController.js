const Product = require('../models/Product');

const ProductController = {
    showProductList: (req, res) => {
        res.render('products');
    },

    getProducts: (req, res) => {
        Product.getAllProducts((err, products) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách sản phẩm:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(products);
        });
    },

    getProductById: (req, res) => {
        const productId = req.params.id;
        Product.getProductById(productId, (err, product) => {
            if (err) {
                console.error('Lỗi khi lấy thông tin sản phẩm:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (!product) {
                return res.status(404).json({ error: 'Không tìm thấy sản phẩm' });
            }
            res.json(product);
        });
    },

    addProduct: (req, res) => {
        const { Product_Code, Supplier_ID, BuyPrice, ProductRating, QuantityInStock } = req.body;

        if (!Product_Code || !Supplier_ID || !BuyPrice || !ProductRating || !QuantityInStock) {
            return res.status(400).json({ error: 'Vui lòng cung cấp đầy đủ thông tin sản phẩm.' });
        }

        Product.addProduct(
            { Product_Code, Supplier_ID, BuyPrice, ProductRating, QuantityInStock },
            (err, result) => {
                if (err) {
                    console.error('Lỗi khi thêm sản phẩm:', err);
                    return res.status(500).json({ error: 'Không thể thêm sản phẩm.' });
                }
                res.status(201).json({
                    message: 'Thêm sản phẩm thành công.',
                    productId: result.insertId,
                });
            }
        );
    },

    addSupplier: (req, res) => {
        const { SupplierName, SupplierEmail, SupplierAddress } = req.body;

        if (!SupplierName || !SupplierEmail || !SupplierAddress) {
            return res.status(400).json({ error: 'Vui lòng cung cấp đầy đủ thông tin nhà cung cấp.' });
        }

        Product.addSupplier(
            { SupplierName, SupplierEmail, SupplierAddress },
            (err, result) => {
                if (err) {
                    console.error('Lỗi khi thêm nhà cung cấp:', err);
                    return res.status(500).json({ error: 'Không thể thêm nhà cung cấp.' });
                }
                res.status(201).json({
                    message: 'Thêm nhà cung cấp thành công.',
                    supplierId: result.insertId,
                });
            }
        );
    }
    
};

module.exports = ProductController;
