let allEmployees = []; // Store all employees

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN');
}

function filterEmployees() {
    const searchInput = document.getElementById('search-bar').value.toLowerCase();
    const departmentFilter = document.getElementById('department-filter').value;

    const filteredEmployees = allEmployees.filter(employee => {
        const matchesSearch = Object.values(employee).some(value => 
            String(value).toLowerCase().includes(searchInput)
        );
        const matchesDepartment = !departmentFilter || employee.Department_ID.toString() === departmentFilter;
        return matchesSearch && matchesDepartment;
    });

    displayEmployees(filteredEmployees);
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

function populateDepartmentFilter(employees) {
    const departments = [...new Set(employees.map(emp => emp.Department_ID))];
    const departmentFilter = document.getElementById('department-filter');

    departments.forEach(dept => {
        const option = document.createElement('option');
        option.value = dept;
        option.textContent = dept;
        departmentFilter.appendChild(option);
    });
}
function searchById() {
    const idInput = document.getElementById('id-search').value;
    fetch(`/api/employees/${idInput}`)
        .then(response => response.json())
        .then(employee => {
            if (employee) {
                displayEmployees([employee]);
            } else {
                alert('Không tìm thấy nhân viên với ID này');
            }
        })
        .catch(error => console.error('Error:', error));
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/employees')
        .then(response => response.json())
        .then(data => {
            allEmployees = data;
            displayEmployees(allEmployees);
            populateDepartmentFilter(allEmployees);
        })
        .catch(error => console.error('Error:', error));

    document.getElementById('search-bar').addEventListener('input', filterEmployees);
    document.getElementById('department-filter').addEventListener('change', filterEmployees);
    document.getElementById('id-search-btn').addEventListener('click', searchById);
});