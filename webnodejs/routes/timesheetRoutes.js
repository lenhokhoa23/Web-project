const express = require('express');
const router = express.Router();
const timesheetController = require('../controllers/timesheetController');

router.get('/timesheet', timesheetController.showTimesheet);
router.get('/api/timesheets', timesheetController.getTimesheet);

module.exports = router;