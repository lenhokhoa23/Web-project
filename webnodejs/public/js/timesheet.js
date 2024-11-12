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
});