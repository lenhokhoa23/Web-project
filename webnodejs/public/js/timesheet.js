let allEmployeeData = [];
let editingEmployeeId = null;

function searchTimesheet() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const rows = document.getElementById('timesheet-data').getElementsByTagName('tr');
    const rows2 = document.getElementById('salary-data').getElementsByTagName('tr');

    for (let row of rows) {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(input) ? '' : 'none';
    }

    for (let row of rows2) {
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
            <td>${item.comment}</td>
            <td><button class="edit-salary-btn" data-id="${item.Employee_ID}">Sửa lương</button></td>`;
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

function updateSalaryBasedOnAttendance() {
    fetch('/api/timesheet/update-salary', { method: 'POST' })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            calculateSalary();
        })
        .catch(error => {
            console.error('Error updating salary based on attendance:', error);
            alert('Có lỗi khi cập nhật lương dựa trên chấm công');
        });
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
function calculateTotalPayroll() {
    fetch('/api/salary/total-payroll')
        .then(response => response.json())
        .then(data => {
            const totalPayrollElement = document.getElementById('total-payroll');
            totalPayrollElement.textContent = `Tổng lương phải trả: ${data.totalPayroll}`;
            totalPayrollElement.classList.remove('hidden');
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi khi tính tổng lương phải trả');
        });
}

function updateDepartmentBonus() {
    const departmentId = document.getElementById('department-select').value;
    const bonusAmount = document.getElementById('department-bonus-amount').value;

    if (!departmentId || !bonusAmount) {
        alert('Vui lòng chọn phòng ban và nhập số tiền bonus');
        return;
    }

    fetch('/api/salary/bonus/department', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            departmentId,
            bonusAmount: parseFloat(bonusAmount)
        })
    })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            calculateSalary();
            document.getElementById('department-bonus-amount').value = '';
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi khi cập nhật bonus theo phòng ban');
        });
}

function populateDepartmentSelect() {
    const departments = [
        { id: 1, name: 'Phòng ban 1' },
        { id: 2, name: 'Phòng ban 2' },
        { id: 3, name: 'Phòng ban 3' },
        { id: 4, name: 'Phòng ban 4' },
        { id: 5, name: 'Phòng ban 5' }
    ];

    const departmentSelect = document.getElementById('department-select');
    departments.forEach(dept => {
        const option = document.createElement('option');
        option.value = dept.id;
        option.textContent = dept.name;
        departmentSelect.appendChild(option);
    });
}
function updateWorkedHours() {
    fetch('/api/timesheet/update-hours', { method: 'POST' })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            fetchTimesheetData();
        })
        .catch(error => {
            console.error('Error updating worked hours:', error);
            alert('Có lỗi khi cập nhật giờ làm việc');
        });
}

function openEditSalaryModal(employeeId) {
    editingEmployeeId = employeeId;
    document.getElementById('edit-employee-id').value = employeeId;
    document.getElementById('edit-salary-modal').style.display = 'block';
}

function closeEditSalaryModal() {
    document.getElementById('edit-salary-modal').style.display = 'none';
}

function saveSalary() {
    const newSalary = document.getElementById('edit-salary').value;
    if (!newSalary) {
        alert('Vui lòng nhập lương mới');
        return;
    }

    fetch('/api/timesheet/salary', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ employeeId: editingEmployeeId, newSalary: parseFloat(newSalary) })
    })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            closeEditSalaryModal();
            fetchTimesheetData();
        })
        .catch(error => {
            console.error('Error updating salary:', error);
            alert('Có lỗi khi cập nhật lương');
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
    document.getElementById('calculate-total-payroll').addEventListener('click', calculateTotalPayroll);
    document.getElementById('update-department-bonus').addEventListener('click', updateDepartmentBonus);
    document.getElementById('update-worked-hours').addEventListener('click', updateWorkedHours);
    document.getElementById('update-salary-attendance').addEventListener('click', updateSalaryBasedOnAttendance);
    document.addEventListener('click', function(e) {
        if (e.target && e.target.classList.contains('edit-salary-btn')) {
            openEditSalaryModal(e.target.getAttribute('data-id'));
        }
    });

    document.querySelector('.close').addEventListener('click', closeEditSalaryModal);
    document.getElementById('save-salary').addEventListener('click', saveSalary);

    window.onclick = function(event) {
        if (event.target == document.getElementById('edit-salary-modal')) {
            closeEditSalaryModal();
        }
    }

    populateDepartmentSelect();
});

function fetchTimesheetData() {
    fetch('/api/timesheets')
        .then(response => response.json())
        .then(data => {
            allEmployeeData = data;
            displayEmployees(data);
        })
        .catch(error => console.error('Error fetching timesheet data:', error));
}

fetchTimesheetData();