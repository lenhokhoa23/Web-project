// server.js
const express = require('express');
const path = require('path');
const employeeRoutes = require('./routes/employeeRoutes');
const projectRoutes = require('./routes/projectRoutes');
const trainingRoutes = require('./routes/trainingRoutes');
const timesheetRoutes = require('./routes/timesheetRoutes');

const app = express();
const port = 3000;

// Cấu hình view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Middleware cho static files
app.use(express.static(path.join(__dirname, 'public')));

// Routes
app.use('/', employeeRoutes);
app.use('/', projectRoutes);
app.use('/', trainingRoutes);
app.use('/', timesheetRoutes);

// Trang chủ
app.get('/', (req, res) => {
    res.render('index');
});

// Khởi động server
app.listen(port, () => {
    console.log(`Server đang chạy tại http://localhost:${port}`);
});