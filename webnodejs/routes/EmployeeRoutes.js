const express = require('express');
const router = express.Router();
const EmployeeController = require('../controllers/EmployeeController');

router.get('/employee', EmployeeController.showEmployeeList);
router.get('/employee/add', EmployeeController.showAddEmployeeForm);
router.get('/api/employees', EmployeeController.getEmployees);
router.get('/api/employees/:id', EmployeeController.getEmployeeById);
router.post('/api/employees', EmployeeController.createEmployee);
router.delete('/api/employees/:id', EmployeeController.deleteEmployee);

module.exports = router;