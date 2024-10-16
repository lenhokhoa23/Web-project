const express = require('express');
const router = express.Router();
const employeeController = require('../controllers/employeeController'); // Đảm bảo đường dẫn này là đúng

// Route để lấy danh sách nhân viên
router.get('/api/employees', employeeController.getEmployees);

// Route để tìm kiếm nhân viên
router.get('/api/employees/search', employeeController.searchEmployees);

// Xuất router
module.exports = router;
