let projects = []; 
let currentSortColumn = ''; 
let isAscending = true; 

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



function showContextMenu(event, projectId) {
    removeContextMenu();

    const contextMenu = document.createElement('div');
    contextMenu.classList.add('context-menu');
    contextMenu.style.top = `${event.clientY}px`;
    contextMenu.style.left = `${event.clientX}px`;

    const deleteButton = document.createElement('button');
    deleteButton.textContent = 'Xoá dự án';
    deleteButton.addEventListener('click', () => {
        if (confirm(`Bạn có chắc muốn xoá dự án với ID ${projectId}?`)) {
            deleteProject(projectId);
        }
        removeContextMenu();
    });

    contextMenu.appendChild(deleteButton);
    document.body.appendChild(contextMenu);

    document.addEventListener('click', removeContextMenu, { once: true });
}

function deleteProject(projectId) {
    console.log('Xoá project ID:', projectId);
    fetch(`/projects/${projectId}`, {
        method: 'DELETE',
    })
    .then(response => response.json())
    .then(data => {
        alert('Dự án đã được xoá.');
        projects = projects.filter(project => project.Project_ID !== parseInt(projectId));
        displayProjects(projects);
    })
    .catch(error => {
        console.error('Lỗi khi xoá dự án:', error);
        alert('Có lỗi xảy ra khi xoá dự án.');
    });
}


function removeContextMenu() {
    const existingMenu = document.querySelector('.context-menu');
    if (existingMenu) {
        existingMenu.remove();
    }
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

    document.getElementById('project-table').addEventListener('contextmenu', (event) => {
        console.log('Context menu event triggered');
        event.preventDefault();

        if (event.target.tagName === 'TD') {
            const row = event.target.closest('tr');
            const projectId = row.querySelector('td').textContent.trim();
            console.log('Project ID:', projectId);
            showContextMenu(event, projectId);
        }
    });
    
});

