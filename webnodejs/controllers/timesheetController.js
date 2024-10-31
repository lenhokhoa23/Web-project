const Timesheet = require('../models/Timesheet');

const timesheetController = {
    showTimesheet: (req, res) => {
        res.render('timesheet');
    },

    getTimesheet: (req, res) => {
        Timesheet.getAllTimeSheets((err, timesheets) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách timesheet:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(timesheets);
        });
    }
};

module.exports = timesheetController;