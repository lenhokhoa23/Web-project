document.addEventListener('DOMContentLoaded', async () => {
    try {
        const response = await fetch('/api/customer');
        const data = await response.json();
        window.allCustomer = data;
        displayCustomers(data);
    } catch (error) {
        console.error('Lỗi khi lấy dữ liệu khách hàng:', error);
    }

    document.getElementById('view-customer-debts').addEventListener('click', getCustomerDebts);
});

function displayCustomers(customers) {
    const tableBody = document.getElementById('customer-data');
    const tableHead = document.querySelector('#customer-table thead tr');
    
    tableHead.innerHTML = `
        <th>Mã Khách hàng</th>
        <th>Tên Khách hàng</th>
        <th>Email</th>
        <th>Số lượng đơn hàng</th>
    `;

    tableBody.innerHTML = '';

    customers.forEach(customer => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${customer.Customer_ID}</td>
            <td>${customer.CustomerName}</td>
            <td>${customer.CustomerEmail}</td>
            <td>${customer.Num_Order}</td>`;
        tableBody.appendChild(row);
    });
}

async function getCustomerDebts() {
    try {
        const response = await fetch('/api/customer-debts');
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.json();
        
        
        displayCustomerDebts(data);
    } catch (error) {
        console.error('Lỗi khi lấy danh sách nợ:', error);
        const tableBody = document.getElementById('customer-data');
        tableBody.innerHTML = `<tr><td colspan="3" class="text-center">Có lỗi xảy ra khi tải dữ liệu: ${error.message}</td></tr>`;
    }
}

function displayCustomerDebts(debts) {
    const tableBody = document.getElementById('customer-data');
    const tableHead = document.querySelector('#customer-table thead tr');
    
    tableHead.innerHTML = `
        <th>Mã Khách hàng</th>
        <th>Tên Khách hàng</th>
        <th>Tổng nợ</th>
    `;

    tableBody.innerHTML = '';

    if (!debts || debts.length === 0) {
        tableBody.innerHTML = `<tr><td colspan="3" class="text-center">Không có khách hàng nào đang nợ</td></tr>`;
        return;
    }

    debts.forEach(customer => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${customer.Customer_ID}</td>
            <td>${customer.CustomerName}</td>
            <td>${customer.totalDept}</td>`;
        tableBody.appendChild(row);
    });
}

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
    displayCustomers(window.allCustomer);
}

let isDescending = true;

function sortTable() {
    const sortedData = [...window.allCustomer].sort((a, b) => {
        return isDescending 
            ? b.Num_Order - a.Num_Order
            : a.Num_Order - b.Num_Order;
    });

    isDescending = !isDescending;

    displayCustomers(sortedData);
}