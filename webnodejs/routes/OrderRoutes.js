const express = require('express');
const router = express.Router();
const orderController = require('../controllers/OrderController');

router.get('/orders', orderController.showOrderList);
router.get('/api/orders', orderController.getOrders);


module.exports = router;