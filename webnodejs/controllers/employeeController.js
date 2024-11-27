const Employee = require('../models/Employee');

const EmployeeController = {
    showEmployeeList: (req, res) => {
        res.render('employeeList');
    },

    showAddEmployeeForm: (req, res) => {
        res.render('addEmployee');
    },

    getEmployees: (req, res) => {
        Employee.getAllEmployees((err, employees) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách nhân viên:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(employees);
        });
    },

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
    },

   createEmployee: (req, res) => {
        const employeeData = req.body;
        
        if (!employeeData || !employeeData.EmployeeName || !employeeData.Department_ID || !employeeData.StartDate) {
            return res.status(400).json({ error: 'Missing required employee data' });
        }
    
        employeeData.ReportTo = employeeData.ReportTo || 9;
    
        Employee.createEmployee(employeeData, (err, result) => {
            if (err) {
                console.error('Lỗi khi thêm nhân viên mới:', err);
                 return res.status(500).json({ error: 'Lỗi server' });
            }
            res.status(201).json({ ...employeeData, Employee_ID: result.insertId });
        });
    },
    deleteEmployee: (req, res) => {
        const id = req.params.id;
        Employee.deleteEmployee(id, (err, result) => {
            if (err) {
                console.error('Lỗi khi xóa nhân viên:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json({ message: 'Nhân viên đã được xóa thành công' });
        });
    }
    
};

module.exports = EmployeeController;