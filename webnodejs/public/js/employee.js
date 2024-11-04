function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN');
}

function searchEmployees() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const rows = document.getElementById('employee-data').getElementsByTagName('tr');

    for (let row of rows) {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(input) ? '' : 'none';
    }
}

function displayEmployees(employees) {
    const tableBody = document.getElementById('employee-data');
    tableBody.innerHTML = '';

    employees.forEach(employee => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${employee.Employee_ID}</td>
            <td>${employee.EmployeeName}</td>
            <td>${formatDate(employee.StartDate)}</td>
            <td>${employee.Department_ID}</td>
            <td>${employee.PhoneNumber || '-'}</td>
            <td>${employee.Email || '-'}</td>
            <td>${employee.EmployeeAddress || '-'}</td>
        `;
        tableBody.appendChild(row);
    });
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/employees')
        .then(response => response.json())
        .then(data => {
            displayEmployees(data);
        })
        .catch(error => console.error('Error:', error));

    document.getElementById('search-bar').addEventListener('keyup', searchEmployees);
});