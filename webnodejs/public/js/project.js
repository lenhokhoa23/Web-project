let projects = [];
let deletedProjects = []; 
let selectedProjectId = null;

function formatDateForProjects(dateString) {
    const date = new Date(dateString);
    const day = ("0" + date.getDate()).slice(-2);
    const month = ("0" + (date.getMonth() + 1)).slice(-2);
    const year = date.getFullYear();
    return `${day}/${month}/${year}`;
}

function searchProjects() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const rows = document.querySelectorAll('#project-table tbody tr');

    rows.forEach(row => {
        const cells = row.getElementsByTagName('td');
        let match = false;
        
        for (let j = 0; j < cells.length; j++) {
            if (cells[j].innerHTML.toLowerCase().indexOf(input) > -1) {
                match = true;
                break;
            }
        }
        row.style.display = match ? '' : 'none';
    });
}

function showExpireProject() {
    fetch('/api/projects/expire-project')
        .then(response => response.json())
        .then(projects => {
            displayProjects(projects);
        })
        .catch(error => console.error('Lỗi khi lấy danh sách project expire', error));
}

function refreshProjects() {
    fetch('/api/projects')
        .then(response => response.json())
        .then(data => {
            const activeProjects = data.filter(project => !deletedProjects.includes(project.Project_ID));
            displayProjects(activeProjects);
        })
        .catch(error => console.error('Error refreshing projects:', error));
}

function displayProjects(projects) {
    const tableBody = document.getElementById('project-data');
    tableBody.innerHTML = ''; 

    projects.forEach(project => {
        const row = document.createElement('tr');
        row.setAttribute('data-project-id', project.Project_ID); 
        row.innerHTML = `
            <td>${project.Project_ID}</td>
            <td>${project.ProjectName}</td>
            <td>${project.Address}</td>
            <td>${formatDateForProjects(project.ContractDate)}</td>
            <td>${formatDateForProjects(project.ContractDue)}</td>
            <td>${project.Customer_ID}</td>
            <td>${project.CustomerName}</td>
        `;
        row.addEventListener('contextmenu', (e) => showProjectContextMenu(e, project.Project_ID));
        tableBody.appendChild(row);
    });
}

function showProjectContextMenu(e, projectId) {
    e.preventDefault();
    selectedProjectId = projectId;
    const contextMenu = document.getElementById('context-menu');
    contextMenu.style.display = 'block';
    contextMenu.style.left = `${e.pageX}px`;
    contextMenu.style.top = `${e.pageY}px`;

    const deleteButton = contextMenu.querySelector('#delete-project');
    deleteButton.onclick = () => {
        deleteProject();
    };
}

function hideProjectContextMenu() {
    const contextMenu = document.getElementById('context-menu');
    contextMenu.style.display = 'none';
}

function deleteProject() {
    if (!selectedProjectId) return;
    if (confirm(`Bạn có chắc muốn xoá dự án với ID ${selectedProjectId}?`)) {
        fetch(`/api/projects/${selectedProjectId}`, {
            method: 'DELETE',
        })
        .then(response => response.json())
        .then(data => {
            alert('Dự án đã được xoá.');
            deletedProjects.push(selectedProjectId);
            const remainingProjects = projects.filter(project => project.Project_ID !== selectedProjectId);
            displayProjects(remainingProjects);
        })
        .catch(error => {
            console.error('Error deleting project:', error);
            alert('Không thể xoá dự án');
        });
    }

    hideProjectContextMenu();
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/projects')
        .then(response => response.json())
        .then(data => {
            projects = data;
            displayProjects(projects);
        })
        .catch(error => console.error('Error loading projects:', error));

    document.getElementById('search-bar').addEventListener('input', searchProjects);
    document.getElementById('refresh').addEventListener('click', refreshProjects);
    document.addEventListener('click', hideProjectContextMenu);
});

document.querySelectorAll('#project-table tbody tr').forEach(row => {
    row.addEventListener('contextmenu', (e) => {
        e.preventDefault();
        selectedProjectId = e.target.closest('tr').dataset.projectId; 
        const contextMenu = document.getElementById('context-menu');
        contextMenu.style.top = `${e.clientY}px`;
        contextMenu.style.left = `${e.clientX}px`;
        contextMenu.style.display = 'block';
    });
});

document.addEventListener('click', () => {
    document.getElementById('context-menu').style.display = 'none';
});
