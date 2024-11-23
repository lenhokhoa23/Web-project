let allEmployeeData = [];

function searchTimesheet() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const rows = document.getElementById('timesheet-data').getElementsByTagName('tr');

    for (let row of rows) {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(input) ? '' : 'none';
    }
}

function showAllEmployees() {
    displayEmployees(allEmployeeData);
}

function filterPerfectScoreEmployees() {
    fetch('/api/timesheets/perfect-score')
        .then(response => response.json())
        .then(employees => {
            displayEmployees(employees);
        })
        .catch(error => console.error('Lỗi khi lấy danh sách nhân viên điểm 10:', error));
}

function filterHardEmployee() {
    fetch('/api/timesheets/hard-employee')
        .then(response => response.json())
        .then(employees => {
            displayEmployees(employees);
        })
        .catch(error => console.error('Lỗi khi lấy danh sách nhân viên chăm chỉ:', error));
}

function displayEmployees(employees) {
    const tableBody = document.getElementById('timesheet-data');
    tableBody.innerHTML = '';
    employees.forEach(item => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${item.Employee_ID}</td>
            <td>${item.EmployeeName}</td>
            <td>${item.WorkedHours}</td>
            <td>${item.score}</td>
            <td>${item.comment}</td>`;
        tableBody.appendChild(row);
    });
}
function toggleSalaryTable() {
    const salaryTable = document.getElementById('salary-table');
    if (salaryTable.classList.contains('hidden')) {
        salaryTable.classList.remove('hidden');
        calculateSalary();
    } else {
        salaryTable.classList.add('hidden');
    }
}

function calculateSalary() {
    fetch('/api/salary/calculate')
        .then(response => response.json())
        .then(data => {
            displaySalaryTable(data);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi khi tính lương');
        });
}

function displaySalaryTable(salaries) {
    const salaryData = document.getElementById('salary-data');
    salaryData.innerHTML = '';

    salaries.forEach(salary => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${salary.Employee_ID}</td>
            <td>${salary.EmployeeName}</td>
            <td>${salary.Salary}</td>
            <td>${salary.Bonus || 0}</td>
            <td>${salary.TotalSalary}</td>
        `;
        salaryData.appendChild(row);
    });
}

function resetBonus() {
    if (!confirm('Bạn có chắc muốn reset tất cả bonus về 0?')) {
        return;
    }

    fetch('/api/salary/bonus/reset', {
        method: 'POST'
    })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            calculateSalary();
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi khi reset bonus');
        });
}

function updateBonus() {
    const employeeName = document.getElementById('bonus-employee-name').value;
    const bonusAmount = document.getElementById('bonus-amount').value;

    if (!employeeName || !bonusAmount) {
        alert('Vui lòng nhập đầy đủ thông tin');
        return;
    }

    fetch('/api/salary/bonus/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            employeeName,
            bonusAmount: parseFloat(bonusAmount)
        })
    })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            calculateSalary();
            document.getElementById('bonus-amount').value = '';
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi khi cập nhật bonus');
        });
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/timesheets')
        .then(response => response.json())
        .then(data => {
            allEmployeeData = data;
            displayEmployees(data);
        })
        .catch(error => console.error('Error fetching timesheet data:', error));

    document.getElementById('search-bar').addEventListener('keyup', searchTimesheet);
    document.getElementById('show-all-employees').addEventListener('click', showAllEmployees);
    document.getElementById('perfectScoreBtn').addEventListener('click', filterPerfectScoreEmployees);
    document.getElementById('hardEmployee').addEventListener('click', filterHardEmployee);
    document.getElementById('toggle-salary-table').addEventListener('click', toggleSalaryTable);
    document.getElementById('reset-bonus').addEventListener('click', resetBonus);
    document.getElementById('update-bonus').addEventListener('click', updateBonus);
});