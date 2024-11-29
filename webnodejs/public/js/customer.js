document.addEventListener('DOMContentLoaded', async () => {
    try {
        const response = await fetch('/api/customer');
        const data = await response.json();
        const tableBody = document.getElementById('customer-data');

        window.allCustomer = data;

        data.forEach(customer => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${customer.Customer_ID}</td>
                <td>${customer.CustomerName}</td>
                <td>${customer.CustomerEmail}</td>
                <td>${customer.Num_Order}</td>`;
            tableBody.appendChild(row);
        });
    } catch (error) {
        console.error('Lỗi khi lấy dữ liệu khách hàng:', error);
    }
});

function searchCustomer() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const table = document.getElementById('customer-table');
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

function refreshTable() {
    const tableBody = document.getElementById('customer-data');
    tableBody.innerHTML = '';

    window.allCustomer.forEach(customer => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${customer.Customer_ID}</td>
            <td>${customer.CustomerName}</td>
            <td>${customer.CustomerEmail}</td>
            <td>${customer.Num_Order}</td>`;
        tableBody.appendChild(row);
    });
}

let isDescending = true;

function sortTable() {
    const sortedData = [...window.allCustomer].sort((a, b) => {
        return isDescending 
            ? b.Num_Order - a.Num_Order
            : a.Num_Order - b.Num_Order;
    });

    isDescending = !isDescending;

    const tableBody = document.getElementById('customer-data');
    tableBody.innerHTML = '';

    sortedData.forEach(customer => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${customer.Customer_ID}</td>
            <td>${customer.CustomerName}</td>
            <td>${customer.CustomerEmail}</td>
            <td>${customer.Num_Order}</td>`;
        tableBody.appendChild(row);
    });
}
