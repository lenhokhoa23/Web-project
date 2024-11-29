const express = require('express');
const path = require('path');
const EmployeeRoutes = require('./routes/EmployeeRoutes');
const ProjectRoutes = require('./routes/ProjectRoutes');
const TrainingRoutes = require('./routes/TrainingRoutes');
const TimesheetRoutes = require('./routes/TimesheetRoutes');
const FeedbackRoutes = require('./routes/FeedbackRoutes');
const ChildrenRoutes = require('./routes/ChildrenRoutes');
const ProductRoutes = require('./routes/ProductRoutes');
const OrderRoutes = require('./routes/OrderRoutes');
const PaymentRoutes = require('./routes/PaymentRoutes');
const CustomerRoutes = require('./routes/CustomerRoutes');

const app = express();
const port = 3000;
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.static(path.join(__dirname, 'public')));


app.use('/', EmployeeRoutes);
app.use('/', ProjectRoutes);
app.use('/', TrainingRoutes);
app.use('/', TimesheetRoutes);
app.use('/', ChildrenRoutes);
app.use('/', FeedbackRoutes);
app.use('/', ProductRoutes);
app.use('/', OrderRoutes);
app.use('/', PaymentRoutes);
app.use('/', CustomerRoutes);

app.get('/', (req, res) => {
    res.render('index');
});


app.listen(port, () => {
    console.log(`Server đang chạy tại http://localhost:${port}`);
});