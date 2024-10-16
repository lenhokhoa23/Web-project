const express = require('express');
const app = express();
const projectRoutes = require('../routes/project'); // Đường dẫn đúng tới file project.js
const employeeRoutes = require('../routes/employee'); // Tìm đường dẫn từ src tới thư mục routes
const mysql = require('mysql2');
const path = require('path');
const port = 3000;

// Middleware
app.use(express.static('public'));
app.set('view engine', 'ejs');
app.set('views', './views');

// Connect to database
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'company_sample',
    port: 3306
});

app.use(express.json());
app.use('/', employeeRoutes);  // Route trang nhân viên
app.use('/', projectRoutes);   // Route trang dự án

// Endpoint để phục vụ index.html
app.get('/', (req, res) => {
    res.render('index');
});

app.get('/employee', (req, res) => {
    res.render('employee'); // Đảm bảo rằng file employee.ejs tồn tại trong folder views
});

// Endpoint để lấy dữ liệu nhân viên
app.get('/api/employee', (req, res) => {
    const query = `
        SELECT e.Employee_ID, e.EmployeeName, e.StartDate, e.Department_ID, 
               ec.PhoneNumber, ec.Email, ec.EmployeeAddress
        FROM employee e
        JOIN employeecontact ec ON e.Employee_ID = ec.Employee_ID
    `;
    db.query(query, (err, results) => {
        if (err) {
            console.error('Lỗi khi lấy dữ liệu nhân viên: ' + err);
            return res.status(500).send('Lỗi khi lấy dữ liệu nhân viên');
        }
        res.json(results); // Trả về dữ liệu dưới dạng JSON
    });
});

// Endpoint để phục vụ timesheet.html
app.get('/timesheet', (req, res) => {
    res.render('timesheet'); // Render file timesheet.ejs
});


// Endpoint để tìm kiếm nhân viên
app.get('/api/timesheet/search', (req, res) => {
    const searchTerm = req.query.q; // Lấy từ tìm kiếm từ query string
    const query = `
        SELECT DISTINCT t.Employee_ID, t.EmployeeName, t.WorkedHours, 
                        p.score, p.comment
        FROM timesheet t
        LEFT JOIN employeeperformance p ON t.Employee_ID = p.Employee_ID
        WHERE t.Employee_ID LIKE ? OR 
              t.EmployeeName LIKE ? OR 
              t.WorkedHours LIKE ? OR 
              p.score LIKE ? OR 
              p.comment LIKE ?
    `;
    const values = [
        `%${searchTerm}%`, 
        `%${searchTerm}%`, 
        `%${searchTerm}%`, 
        `%${searchTerm}%`, 
        `%${searchTerm}%`
    ];

    db.query(query, values, (err, results) => {
        if (err) {
            console.error('Lỗi khi tìm kiếm: ' + err);
            return res.status(500).send('Lỗi khi tìm kiếm');
        }
        res.json(results);
    });
});

// Endpoint để phục vụ training.html
app.get('/training', (req, res) => {
    res.render('training'); // Render file training.ejs
});

// Endpoint để lấy dữ liệu đào tạo
app.get('/api/training', (req, res) => {
    const query = `
        SELECT t.Training_ID, t.TrainingName, t.StartDate, t.EndDate, e.EmployeeName
        FROM training t
        JOIN employee e ON t.Employee_ID = e.Employee_ID
    `;
    db.query(query, (err, results) => {
        if (err) {
            console.error('Lỗi khi lấy dữ liệu đào tạo: ' + err);
            return res.status(500).send('Lỗi khi lấy dữ liệu đào tạo');
        }
        res.json(results); // Trả về dữ liệu dưới dạng JSON
    });
});

// Endpoint để phục vụ project.html
app.get('/projects', (req, res) => {
    res.render('project'); // Render file project.ejs
});

// Endpoint để lấy dữ liệu dự án
app.get('/api/projects', (req, res) => {
    const query = `
        SELECT p.Project_ID, p.ProjectName, p.Address, 
               c.ContractDate, c.ContractDue, c.Customer_ID, 
               cu.CustomerName
        FROM project p
        JOIN contract c ON p.Project_ID = c.Project_ID
        JOIN customer cu ON c.Customer_ID = cu.Customer_ID
    `;
    db.query(query, (err, results) => {
        if (err) {
            console.error('Lỗi khi lấy dữ liệu dự án: ' + err);
            return res.status(500).send('Lỗi khi lấy dữ liệu dự án');
        }
        res.json(results); // Trả về dữ liệu dưới dạng JSON
    });
});

// Run server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
