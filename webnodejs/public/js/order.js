let allOrders = [];
let orderValues = {};
let showingOrderValues = false;
let currentView = 'all'; // 'all', 'shipped', 'notShipped', 'values', 'productValues'

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
        row.dataset.orderId = order.Order_ID;
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
        row.addEventListener('mouseenter', showOrderValue);
        row.addEventListener('mouseleave', hideOrderValue);
        tableBody.appendChild(row);
    });
}

function displayOrderValues(orders) {
    const tableBody = document.getElementById('order-data');
    if (!tableBody) return;

    const headerRow = document.querySelector('#order-table thead tr');
    headerRow.innerHTML = `
        <th>Mã đơn hàng</th>
        <th>Mã khách hàng</th>
        <th>Giá trị đơn hàng</th>
    `;

    tableBody.innerHTML = '';

    orders.forEach(order => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${order.Order_ID}</td>
            <td>${order.Customer_ID}</td>
            <td>${order.totalValue}</td>
        `;
        tableBody.appendChild(row);
    });
}

function displayProductValues(products) {
    const tableBody = document.getElementById('order-data');
    if (!tableBody) return;

    // Update table headers
    const headerRow = document.querySelector('#order-table thead tr');
    headerRow.innerHTML = `
        <th>Mã sản phẩm</th>
        <th>Tổng giá trị</th>
    `;

    tableBody.innerHTML = '';

    products.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${product.Product_Code || '-'}</td>
            <td>${parseFloat(product.valueOfPro) || '0'}</td>
        `;
        tableBody.appendChild(row);
    });
}



function toggleView(view) {
    currentView = view;
    const headerRow = document.querySelector('#order-table thead tr');

    if (view === 'values') {
        showingOrderValues = true;
        fetch('/api/orders-value')
            .then(response => response.json())
            .then(data => {
                displayOrderValues(data);
            })
            .catch(error => {
                console.error('Error fetching order values:', error);
                alert('Có lỗi khi tải dữ liệu giá trị đơn hàng');
            });
    } else if (view === 'productValues') {
        showingOrderValues = true;
        fetch('/api/product-values')
            .then(response => response.json())
            .then(data => {
                displayProductValues(data);
            })
            .catch(error => {
                console.error('Error fetching product values:', error);
                alert('Có lỗi khi tải dữ liệu giá trị sản phẩm');
            });
    } else {
        showingOrderValues = false;
        headerRow.innerHTML = `
            <th>Mã đơn hàng</th>
            <th>Mã khách hàng</th>
            <th>Tên khách hàng</th>
            <th>Ngày đặt hàng</th>
            <th>Ngày yêu cầu</th>
            <th>Địa chỉ ship</th>
            <th>Ngày ship hàng</th>
            <th>Trạng thái</th>
        `;
        if (view === 'all') {
            displayOrders(allOrders);
        } else if (view === 'shipped') {
            fetch('/api/orders-by-status/Shipped')
                .then(response => response.json())
                .then(data => {
                    displayOrders(data);
                })
                .catch(error => {
                    console.error('Error fetching shipped orders:', error);
                    alert('Có lỗi khi tải danh sách đơn hàng đã giao');
                });
        } else if (view === 'notShipped') {
            fetch('/api/orders-not-shipped')
                .then(response => response.json())
                .then(data => {
                    displayOrders(data);
                })
                .catch(error => {
                    console.error('Error fetching not shipped orders:', error);
                    alert('Có lỗi khi tải danh sách đơn hàng chưa giao');
                });
        }
    }

    updateButtonStates();
}

function updateButtonStates() {
    const buttons = {
        'all': document.getElementById('view-all'),
        'shipped': document.getElementById('view-shipped'),
        'notShipped': document.getElementById('view-not-shipped'),
        'values': document.getElementById('toggle-view'),
        'productValues': document.getElementById('view-product-values')
    };

    for (const [view, button] of Object.entries(buttons)) {
        if (currentView === view) {
            button.disabled = true;
            button.classList.add('active');
        } else {
            button.disabled = false;
            button.classList.remove('active');
        }
    }
}

function showOrderValue(event) {
    const orderId = event.currentTarget.dataset.orderId;
    const tooltip = document.getElementById('order-value-tooltip');
    
    if (orderValues[orderId]) {
        tooltip.textContent = `Giá trị đơn hàng: ${orderValues[orderId]}`;
        tooltip.style.display = 'block';
        tooltip.style.left = `${event.pageX + 10}px`;
        tooltip.style.top = `${event.pageY + 10}px`;
    }
}

function hideOrderValue() {
    const tooltip = document.getElementById('order-value-tooltip');
    tooltip.style.display = 'none';
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/orders')
        .then(response => response.json())
        .then(data => {
            allOrders = data;
            displayOrders(data);
        })
        .catch(error => console.error('Error fetching orders:', error));

    fetch('/api/orders-value')
        .then(response => response.json())
        .then(data => {
            orderValues = data.reduce((acc, order) => {
                acc[order.Order_ID] = order.totalValue;
                return acc;
            }, {});
        })
        .catch(error => console.error('Error fetching order values:', error));

    document.getElementById('search-bar').addEventListener('keyup', searchOrder);
    document.getElementById('toggle-view').addEventListener('click', () => toggleView('values'));
    document.getElementById('view-all').addEventListener('click', () => toggleView('all'));
    document.getElementById('view-shipped').addEventListener('click', () => toggleView('shipped'));
    document.getElementById('view-not-shipped').addEventListener('click', () => toggleView('notShipped'));
    document.getElementById('view-product-values').addEventListener('click', () => toggleView('productValues'));

    updateButtonStates();
});