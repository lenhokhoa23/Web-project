let projects = []; // Biến toàn cục lưu trữ dữ liệu dự án
let currentSortColumn = ''; // Theo dõi cột hiện tại đang được sắp xếp
let isAscending = true; // Theo dõi thứ tự sắp xếp

function formatDate(dateString) {
    const date = new Date(dateString);
    const day = ("0" + date.getDate()).slice(-2);
    const month = ("0" + (date.getMonth() + 1)).slice(-2);
    const year = date.getFullYear();
    return `${day}/${month}/${year}`;
}

function searchProjects() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const table = document.getElementById('project-table');
    const rows = table.getElementsByTagName('tr');

    const isExactIdSearch = /^\d+\s$/.test(input);

    for (let i = 1; i < rows.length; i++) {
        let cells = rows[i].getElementsByTagName('td');
        let projectId = cells[0].innerHTML.trim();
        let match = false;

        if (isExactIdSearch) {
            if (projectId === input.trim()) {
                match = true;
            }
        } else {
            for (let j = 0; j < cells.length; j++) {
                if (cells[j].innerHTML.toLowerCase().indexOf(input) > -1) {
                    match = true;
                    break;
                }
            }
        }
        rows[i].style.display = match ? '' : 'none';
    }
}

function showExpireProject() {
    fetch('/api/projects/expire-project')
        .then(response => response.json())
        .then(projects => {
            displayProjects(projects);
        })
        .catch(error => console.error('Lỗi khi lấy danh sách project expire', error))
}

function refresh() {
    displayProjects(projects);
}

function displayProjects(projects) {
    const tableBody = document.getElementById('project-data');
    tableBody.innerHTML = '';

    projects.forEach(project => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${project.Project_ID}</td>
            <td>${project.ProjectName}</td>
            <td>${project.Address}</td>
            <td>${formatDate(project.ContractDate)}</td>
            <td>${formatDate(project.ContractDue)}</td>
            <td>${project.Customer_ID}</td>
            <td>${project.CustomerName}</td>
        `;
        tableBody.appendChild(row);
    });
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/projects')
        .then(response => response.json())
        .then(data => {
            projects = data;
            displayProjects(projects);
        })
        .catch(error => console.error('Lỗi khi lấy dữ liệu dự án:', error));
    document.getElementById('refresh').addEventListener('click', refresh);
    document.getElementById('expire-project').addEventListener('click', showExpireProject);
    document.getElementById('search-bar').addEventListener('keyup', searchProjects);
});