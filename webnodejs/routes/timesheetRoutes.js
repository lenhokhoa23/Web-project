const express = require('express');
const router = express.Router();
const timesheetController = require('../controllers/timesheetController');

router.get('/timesheet', timesheetController.showTimesheet);
router.get('/api/timesheets', timesheetController.getTimesheet);
router.get('/api/timesheets/perfect-score', timesheetController.getPerfectScoreEmployees);
router.get('/api/timesheets/hard-employee', timesheetController.getHardEmployees);
router.get('/api/salary/calculate', timesheetController.calculateTotalSalary);
router.post('/api/salary/bonus/reset', timesheetController.resetAllBonus);
router.post('/api/salary/bonus/update', timesheetController.updateEmployeeBonus);
router.get('/api/salary/total-payroll', timesheetController.calculateTotalPayroll);
router.post('/api/salary/bonus/department', timesheetController.updateBonusByDepartment);

module.exports = router;