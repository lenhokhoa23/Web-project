const express = require('express');
const path = require('path');
const employeeRoutes = require('./routes/EmployeeRoutes');
const projectRoutes = require('./routes/projectRoutes');
const trainingRoutes = require('./routes/trainingRoutes');
const timesheetRoutes = require('./routes/timesheetRoutes');
const feedbackRoutes = require('./routes/FeedbackRoutes');
const childrenRoutes = require('./routes/childrenRoutes');
const productRoutes = require('./routes/productRoutes');
const orderRoutes = require('./routes/OrderRoutes');
const paymentRoutes = require('./routes/paymentRoutes');
const app = express();
const port = 3000;
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.static(path.join(__dirname, 'public')));


app.use('/', employeeRoutes);
app.use('/', projectRoutes);
app.use('/', trainingRoutes);
app.use('/', timesheetRoutes);
app.use('/', childrenRoutes);
app.use('/', feedbackRoutes);
app.use('/', productRoutes);
app.use('/', orderRoutes);
app.use('/', paymentRoutes);

app.get('/', (req, res) => {
    res.render('index');
});


app.listen(port, () => {
    console.log(`Server đang chạy tại http://localhost:${port}`);
});