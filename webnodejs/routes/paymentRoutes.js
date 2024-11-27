const express = require('express');
const router = express.Router();
const paymentController = require('../controllers/PaymentController');

router.get('/payment', paymentController.showPaymentList);
router.get('/api/payment', paymentController.getPayments);
router.get('/api/payment/customer/:id', paymentController.getPaymentByCustomerId);

module.exports = router;
