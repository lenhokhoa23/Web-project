let allOrders = [];
function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN');
}
function searchOrder() {
    const input = document.getElementById('search-bar').value.toLowerCase().trim();
    const rows = document.getElementById('order-data').getElementsByTagName('tr');

    for (let row of rows) {
        const text = row.textContent.toLowerCase();
        row.style.display = text.includes(input) ? '' : 'none';
    }
}
function displayOrders(orders) {
    const tableBody = document.getElementById('order-data');
    if (!tableBody) return; 

    tableBody.innerHTML = '';

    orders.forEach(order => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${order.Order_ID}</td>
            <td>${order.Customer_ID}</td>
            <td>${order.CustomerName}</td>
            <td>${formatDate(order.OrderDate)}</td>
            <td>${formatDate(order.OrderRequired)}</td>
            <td>${order.ShipAddress || '-'}</td>
            <td>${formatDate(order.ShippedDate)}</td>
            <td>${order.Status || '-'}</td>
        `;
        tableBody.appendChild(row);
    });
}

function refresh() {
    displayOrders(allOrders)
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/orders')
        .then(response => response.json())
        .then(data => {
            allOrders = data;
            displayOrders(data);
        })
        .catch(error => console.error('Error fetching timesheet data:', error));
    document.getElementById('refresh').addEventListener('click', refresh);
    document.getElementById('search-bar').addEventListener('keyup', searchOrder);
}); 