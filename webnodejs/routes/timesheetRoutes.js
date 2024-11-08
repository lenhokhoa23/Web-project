const express = require('express');
const router = express.Router();
const timesheetController = require('../controllers/timesheetController');

router.get('/timesheet', timesheetController.showTimesheet);
router.get('/api/timesheets', timesheetController.getTimesheet);
router.get('/api/timesheets/perfect-score', timesheetController.getPerfectScoreEmployees);
router.get('/api/timesheets/hard-employee', timesheetController.getHardEmployees);

module.exports = router;