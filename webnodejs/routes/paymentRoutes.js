const express = require('express');
const router = express.Router();
const PaymentController = require('../controllers/PaymentController');

router.get('/payment', PaymentController.showPaymentList);
router.get('/api/payment', PaymentController.getPayments);
router.get('/api/payment/customer/:id', PaymentController.getPaymentByCustomerId);

module.exports = router;
