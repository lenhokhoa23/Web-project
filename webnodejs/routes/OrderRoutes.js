const express = require('express');
const router = express.Router();
const orderController = require('../controllers/OrderController');

router.get('/orders', orderController.showOrderList);
router.get('/api/orders', orderController.getOrders);
router.get('/api/orders-value', orderController.getOrdersValue);
router.get('/api/orders-by-status/:status', orderController.getOrdersByStatus);
router.get('/api/orders-not-shipped', orderController.getOrdersNotShipped);
router.get('/api/product-values', orderController.getProductValues);
router.get('/api/order-details/:orderId', orderController.getOrderDetails);
router.get('/api/orders-by-date', orderController.getOrdersByDateRange);
router.get('/api/total-revenue', orderController.getTotalRevenue);
router.get('/api/top-customers', orderController.getTopCustomers);

module.exports = router;