const express = require('express');
const router = express.Router();
const ProductController = require('../controllers/ProductController');

router.get('/products', ProductController.showProductList);
router.get('/api/products', ProductController.getProducts);
router.get('/api/products/:id', ProductController.getProductById);
router.post('/api/products', ProductController.addProduct);
router.post('/api/suppliers', ProductController.addSupplier);

module.exports = router;