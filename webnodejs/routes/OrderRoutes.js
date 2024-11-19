const express = require('express');
const router = express.Router();
const orderController = require('../controllers/OrderController');

router.get('/orders', orderController.showOrderList);
router.get('/api/orders', orderController.getOrders);
router.get('/api/orders-value', orderController.getOrdersValue);
router.get('/api/orders-by-status/:status', orderController.getOrdersByStatus);
router.get('/api/orders-not-shipped', orderController.getOrdersNotShipped);
router.get('/api/product-values', orderController.getProductValues);

module.exports = router;