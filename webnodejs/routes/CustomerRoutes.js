const express = require('express');
const router = express.Router();
const CustomerController = require('../controllers/CustomerController');

router.get('/customer', CustomerController.showCustomerList);
router.get('/api/customer', CustomerController.getCustomer);
router.get('/api/customer/:id', CustomerController.getCustomerById);

module.exports = router;