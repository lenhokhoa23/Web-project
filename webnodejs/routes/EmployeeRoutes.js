// routes/employeeRoutes.js
const express = require('express');
const router = express.Router();
const employeeController = require('../controllers/employeeController');

// Route hiển thị trang
router.get('/employee', employeeController.showEmployeeList);

// Route API
router.get('/api/employees', employeeController.getEmployees);
router.get('/api/employees/:id', employeeController.getEmployeeById);

module.exports = router;