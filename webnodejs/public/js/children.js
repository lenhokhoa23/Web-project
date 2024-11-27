document.addEventListener('DOMContentLoaded', async () => {
    try {
        const response = await fetch('/api/children');
        const data = await response.json();
        const tableBody = document.getElementById('children-data');

        window.allChildren = data;

        data.forEach(child => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${child.Employee_ID}</td>
                <td>${child.EmployeeName}</td>
                <td>${child.ChildrenName}</td>
                <td>${child.Gender}</td>
                <td>${child.Department_ID}</td>`;
            tableBody.appendChild(row);
        });
        populateDepartmentFilter(data);
    } catch (error) {
        console.error('Lỗi khi lấy dữ liệu con cái nhân viên:', error);
    }
});

function searchChildren() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const table = document.getElementById('children-table');
    const rows = table.getElementsByTagName('tr');

    for (let i = 1; i < rows.length; i++) {
        let cells = rows[i].getElementsByTagName('td');
        let match = false;

        for (let j = 0; j < cells.length; j++) {
            if (cells[j].innerHTML.toLowerCase().indexOf(input) > -1) {
                match = true;
                break;
            }
        }
        rows[i].style.display = match ? '' : 'none';
    }
}

function populateDepartmentFilter(children) {
    const departments = [...new Set(children.map(child => child.Department_ID))];
    const departmentFilter = document.getElementById('department-filter');
    
    departments.forEach(dept => {
        const option = document.createElement('option');
        option.value = dept;
        option.textContent = `Phòng ban ${dept}`;
        departmentFilter.appendChild(option);
    });
}

function filterByDepartment() {
    const departmentFilter = document.getElementById('department-filter').value;
    const tableBody = document.getElementById('children-data');
    
    tableBody.innerHTML = '';

    const filteredChildren = window.allChildren.filter(child => 
        !departmentFilter || child.Department_ID.toString() === departmentFilter
    );

    filteredChildren.forEach(child => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${child.Employee_ID}</td>
            <td>${child.EmployeeName}</td>
            <td>${child.ChildrenName}</td>
            <td>${child.Gender}</td>
            <td>${child.Department_ID}</td>`;
        tableBody.appendChild(row);
    });
}

function refreshTable() {
    const tableBody = document.getElementById('children-data');
    const departmentFilter = document.getElementById('department-filter');
    
    departmentFilter.value = '';

    tableBody.innerHTML = '';
    window.allChildren.forEach(child => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${child.Employee_ID}</td>
            <td>${child.EmployeeName}</td>
            <td>${child.ChildrenName}</td>
            <td>${child.Gender}</td>
            <td>${child.Department_ID}</td>`;
        tableBody.appendChild(row);
    });
}