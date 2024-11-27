const express = require('express');
const router = express.Router();
const TimesheetController = require('../controllers/TimesheetController');

router.get('/timesheet', TimesheetController.showTimesheet);
router.get('/api/timesheets', TimesheetController.getTimesheet);
router.get('/api/timesheets/perfect-score', TimesheetController.getPerfectScoreEmployees);
router.get('/api/timesheets/hard-employee', TimesheetController.getHardEmployees);
router.get('/api/salary/calculate', TimesheetController.calculateTotalSalary);
router.post('/api/salary/bonus/reset', TimesheetController.resetAllBonus);
router.post('/api/salary/bonus/update', TimesheetController.updateEmployeeBonus);
router.get('/api/salary/total-payroll', TimesheetController.calculateTotalPayroll);
router.post('/api/salary/bonus/department', TimesheetController.updateBonusByDepartment);

module.exports = router;