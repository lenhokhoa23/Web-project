// routes/productRoutes.js
const express = require('express');
const router = express.Router();
const productController = require('../controllers/productController');

// Route hiển thị trang
router.get('/products', productController.showProductList);

// Route API
router.get('/api/products', productController.getProducts);
router.get('/api/products/:id', productController.getProductById);
router.post('/api/products', productController.addProduct);
router.post('/api/suppliers', productController.addSupplier);

module.exports = router;