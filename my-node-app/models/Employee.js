// models/Employee.js
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'company_sample',
    port: 3306
});

class Employee {
    constructor(Employee_ID, EmployeeName, StartDate, Department_ID) {
        this.Employee_ID = Employee_ID;
        this.EmployeeName = EmployeeName;
        this.StartDate = StartDate;
        this.Department_ID = Department_ID;
    }

    static getAllEmployees(callback) {
        const query = 'SELECT * FROM employee';
        db.query(query, (err, results) => {
            if (err) {
                return callback(err);
            }
            callback(null, results);
        });
    }

    // Bạn có thể thêm các phương thức khác như create, update, delete tại đây
}

module.exports = Employee;
