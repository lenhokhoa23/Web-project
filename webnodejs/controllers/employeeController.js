// controllers/employeeController.js
const Employee = require('../models/Employee');

const employeeController = {
    // Hiển thị trang danh sách nhân viên
    showEmployeeList: (req, res) => {
        res.render('employeeList');
    },

    // Lấy dữ liệu nhân viên cho API
    getEmployees: (req, res) => {
        Employee.getAllEmployees((err, employees) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách nhân viên:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(employees);
        });
    },

    // Lấy thông tin một nhân viên
    getEmployeeById: (req, res) => {
        const id = req.params.id;
        Employee.getEmployeeById(id, (err, employee) => {
            if (err) {
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (!employee) {
                return res.status(404).json({ error: 'Không tìm thấy nhân viên' });
            }
            res.json(employee);
        });
    }
};

module.exports = employeeController;