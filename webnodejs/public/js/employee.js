let allEmployees = [];
let selectedEmployeeId = null;
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
    if (!tableBody) return;

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
        row.addEventListener('contextmenu', (e) => showContextMenu(e, employee.Employee_ID));
        tableBody.appendChild(row);
    });
}

function populateDepartmentFilter(employees) {
    const departmentFilter = document.getElementById('department-filter');
    if (!departmentFilter) return;

    const departments = [...new Set(employees.map(emp => emp.Department_ID))];

    departments.forEach(dept => {
        const option = document.createElement('option');
        option.value = dept;
        option.textContent = dept;
        departmentFilter.appendChild(option);
    });
}
function showContextMenu(e, employeeId) {
    e.preventDefault();
    selectedEmployeeId = employeeId;
    const contextMenu = document.getElementById('context-menu');
    contextMenu.style.display = 'block';
    contextMenu.style.left = `${e.pageX}px`;
    contextMenu.style.top = `${e.pageY}px`;
}

function hideContextMenu() {
    const contextMenu = document.getElementById('context-menu');
    contextMenu.style.display = 'none';
}

function deleteEmployee() {
    if (!selectedEmployeeId) return;

    if (confirm('Bạn có chắc muốn xóa nhân viên này?')) {
        fetch(`/api/employees/${selectedEmployeeId}`, {
            method: 'DELETE'
        })
            .then(response => response.json())
            .then(data => {
                alert(data.message);
                setupEmployeeListPage();
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Có lỗi khi xóa nhân viên');
            });
    }

    hideContextMenu();
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
function refresh() {
    displayEmployees(allEmployees)
}
function setupEmployeeListPage() {
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
    document.getElementById('refresh').addEventListener('click', refresh);
    document.getElementById('delete-employee').addEventListener('click', deleteEmployee);
    document.addEventListener('click', hideContextMenu);
}

function setupAddEmployeePage() {
    const form = document.getElementById('add-employee-form');
    if (!form) return;

    form.addEventListener('submit', (event) => {
        event.preventDefault();

        const formData = new FormData(form);
        const employeeData = {};
        formData.forEach((value, key) => {
            employeeData[key] = value;
        });

        console.log('Sending data:', employeeData);

        fetch('/api/employees', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(employeeData),
        })
        .then(response => {
            if (!response.ok) {
                return response.json().then(err => Promise.reject(err));
            }
            return response.json();
        })
        .then(newEmployee => {
            alert('Nhân viên mới đã được thêm thành công!');
            window.location.href = '/employee';
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Có lỗi xảy ra khi thêm nhân viên mới: ' + (error.error || 'Lỗi không xác định'));
        });
    });
}

document.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('employee-data')) {
        setupEmployeeListPage();
    } else if (document.getElementById('add-employee-form')) {
        setupAddEmployeePage();
    }
});