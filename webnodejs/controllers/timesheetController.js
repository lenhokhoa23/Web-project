const Timesheet = require('../models/Timesheet');

const TimesheetController = {
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
    },

    getPerfectScoreEmployees: (req, res) => {
        Timesheet.getPerfectScoreEmployees((err, timesheets) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách nhân viên điểm 10:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(timesheets);
        });
    },

    getHardEmployees: (req, res) => {
        Timesheet.getHardEmployees((err, timesheets) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách nhân viên điểm 10:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(timesheets);
        });
    },
    calculateTotalSalary: (req, res) => {
        Timesheet.calculateTotalSalary((err, salaries) => {
            if (err) {
                console.error('Lỗi khi tính lương:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(salaries);
        });
    },

    resetAllBonus: (req, res) => {
        Timesheet.resetAllBonus((err, result) => {
            if (err) {
                console.error('Lỗi khi reset bonus:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json({ message: 'Đã reset tất cả bonus về 0' });
        });
    },

    updateEmployeeBonus: (req, res) => {
        const { employeeName, bonusAmount } = req.body;
        
        if (!employeeName || bonusAmount === undefined) {
            return res.status(400).json({ error: 'Thiếu thông tin cần thiết' });
        }
    
        Timesheet.updateEmployeeBonus(employeeName, parseFloat(bonusAmount), (err, result) => {
            if (err) {
                console.error('Lỗi khi cập nhật bonus:', err);
                return res.status(500).json({ error: 'Lỗi server: ' + err.message });
            }
            res.json({ message: 'Đã cập nhật bonus thành công' });
        });
    },
    calculateTotalPayroll: (req, res) => {
        Timesheet.calculateTotalPayroll((err, totalPayroll) => {
            if (err) {
                console.error('Lỗi khi tính tổng lương:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json({ totalPayroll });
        });
    },

    updateBonusByDepartment: (req, res) => {
        const { departmentId, bonusAmount } = req.body;
        
        if (!departmentId || bonusAmount === undefined) {
            return res.status(400).json({ error: 'Thiếu thông tin cần thiết' });
        }

        Timesheet.updateBonusByDepartment(departmentId, parseFloat(bonusAmount), (err, result) => {
            if (err) {
                console.error('Lỗi khi cập nhật bonus theo phòng ban:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json({ message: 'Đã cập nhật bonus theo phòng ban thành công' });
        });
    },
    updateEmployeeSalary: (req, res) => {
        const { employeeId, newSalary } = req.body;
        
        if (!employeeId || !newSalary) {
            return res.status(400).json({ error: 'Thiếu thông tin cần thiết' });
        }

        Timesheet.updateEmployeeSalary(employeeId, newSalary, (err, result) => {
            if (err) {
                console.error('Lỗi khi cập nhật lương nhân viên:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json({ message: 'Đã cập nhật lương nhân viên thành công' });
        });
    },

    updateWorkedHours: (req, res) => {
        Timesheet.updateWorkedHours((err, result) => {
            if (err) {
                console.error('Lỗi khi cập nhật giờ làm việc:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json({ message: 'Đã cập nhật giờ làm việc thành công' });
        });
    },
    
    updateSalaryBasedOnAttendance: (req, res) => {
        Timesheet.updateSalaryBasedOnAttendance((err, result) => {
            if (err) {
                console.error('Lỗi khi cập nhật lương dựa trên chấm công:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json({ message: 'Đã cập nhật lương dựa trên chấm công thành công' });
        });
    }
};

module.exports = TimesheetController;