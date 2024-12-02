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
router.put('/api/timesheet/salary', TimesheetController.updateEmployeeSalary);
router.post('/api/timesheet/update-hours', TimesheetController.updateWorkedHours);
router.post('/api/timesheet/update-salary', TimesheetController.updateSalaryBasedOnAttendance);


module.exports = router;
