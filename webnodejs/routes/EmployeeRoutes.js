const express = require('express');
const router = express.Router();
const employeeController = require('../controllers/employeeController');

router.get('/employee', employeeController.showEmployeeList);
router.get('/employee/add', employeeController.showAddEmployeeForm);
router.get('/api/employees', employeeController.getEmployees);
router.get('/api/employees/:id', employeeController.getEmployeeById);
router.post('/api/employees', employeeController.createEmployee);

module.exports = router;