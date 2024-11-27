const express = require('express');
const router = express.Router();
const OrderController = require('../controllers/OrderController');

router.get('/orders', OrderController.showOrderList);
router.get('/api/orders', OrderController.getOrders);
router.get('/api/orders-value', OrderController.getOrdersValue);
router.get('/api/orders-by-status/:status', OrderController.getOrdersByStatus);
router.get('/api/orders-not-shipped', OrderController.getOrdersNotShipped);
router.get('/api/product-values', OrderController.getProductValues);
router.get('/api/order-details/:orderId', OrderController.getOrderDetails);
router.get('/api/orders-by-date', OrderController.getOrdersByDateRange);
router.get('/api/total-revenue', OrderController.getTotalRevenue);
router.get('/api/top-customers', OrderController.getTopCustomers);

module.exports = router;