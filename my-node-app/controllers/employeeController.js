const db = require('../src/config/db');

// Lấy danh sách nhân viên
exports.getEmployees = (req, res) => {
    const query = 'SELECT e.Employee_ID, e.EmployeeName, e.StartDate, e.Department_ID, c.PhoneNumber, c.Email, c.EmployeeAddress FROM employee e JOIN employeecontact c ON e.Employee_ID = c.Employee_ID';
    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results);
    });
};

exports.searchEmployees = (req, res) => {
    const searchTerm = req.query.q.trim(); // Loại bỏ khoảng trắng thừa

    // Kiểm tra xem có phải là một ID hay không
    const idPattern = /^\d+$/; // Biểu thức chính quy để kiểm tra ID
    if (idPattern.test(searchTerm)) {
        // Nếu tìm kiếm là ID, chỉ lấy nhân viên với ID đó
        const query = `
            SELECT e.Employee_ID, e.EmployeeName, ec.PhoneNumber, ec.Email, ec.EmployeeAddress
            FROM employee e
            JOIN employeecontact ec ON e.Employee_ID = ec.Employee_ID
            WHERE e.Employee_ID = ?
        `;
        db.query(query, [searchTerm], (err, results) => {
            if (err) {
                console.error('Lỗi khi tìm kiếm nhân viên: ' + err);
                return res.status(500).send('Lỗi khi tìm kiếm nhân viên');
            }
            res.json(results);
        });
    } else {
        // Nếu không, thực hiện tìm kiếm theo tên, số điện thoại hoặc email
        const query = `
            SELECT DISTINCT e.Employee_ID, e.EmployeeName, ec.PhoneNumber, ec.Email, ec.EmployeeAddress
            FROM employee e
            JOIN employeecontact ec ON e.Employee_ID = ec.Employee_ID
            WHERE e.EmployeeName LIKE ? OR ec.PhoneNumber LIKE ? OR ec.Email LIKE ?
        `;
        const values = [`%${searchTerm}%`, `%${searchTerm}%`, `%${searchTerm}%`];

        db.query(query, values, (err, results) => {
            if (err) {
                console.error('Lỗi khi tìm kiếm nhân viên: ' + err);
                return res.status(500).send('Lỗi khi tìm kiếm nhân viên');
            }
            res.json(results);
        });
    }
};
