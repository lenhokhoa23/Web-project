// controllers/productController.js
const Product = require('../models/Product');

const productController = {
    // Hiển thị trang danh sách sản phẩm
    showProductList: (req, res) => {
        res.render('products');
    },

    // Lấy dữ liệu sản phẩm cho API
    getProducts: (req, res) => {
        Product.getAllProducts((err, products) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách sản phẩm:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(products);
        });
    },

    // Lấy thông tin một sản phẩm
    getProductById: (req, res) => {
        const productId = req.params.id;
        Product.getProductById(productId, (err, product) => {
            if (err) {
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (!product) {
                return res.status(404).json({ error: 'Không tìm thấy sản phẩm' });
            }
            res.json(product);
        });
    }
};

module.exports = productController;
