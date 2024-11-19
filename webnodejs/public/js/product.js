document.addEventListener('DOMContentLoaded', async () => {
    try {
        const response = await fetch('/api/products');
        const data = await response.json();
        const tableBody = document.getElementById('product-data');

        window.allProducts = data;

        // Hiển thị dữ liệu ban đầu
        data.forEach(product => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${product.Product_ID}</td>
                <td>${product.Product_Code}</td>
                <td>${product.OrderCount}</td>
                <td>${product.SupplierName}</td>`;
            tableBody.appendChild(row);
        });

        populateSupplierFilter(data);
    } catch (error) {
        console.error('Lỗi khi lấy dữ liệu sản phẩm:', error);
    }
});

function searchProducts() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const table = document.getElementById('product-table');
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

function populateSupplierFilter(products) {
    const suppliers = [...new Set(products.map(product => product.SupplierName))];
    const supplierFilter = document.getElementById('supplier-filter');
    
    suppliers.forEach(supplier => {
        const option = document.createElement('option');
        option.value = supplier;
        option.textContent = supplier;
        supplierFilter.appendChild(option);
    });
}

function filterBySupplier() {
    const supplierFilter = document.getElementById('supplier-filter').value;
    const tableBody = document.getElementById('product-data');
    
    tableBody.innerHTML = '';

    // Lọc dữ liệu theo SupplierName đã chọn
    const filteredProducts = window.allProducts.filter(product => 
        !supplierFilter || product.SupplierName === supplierFilter
    );

    // Hiển thị lại dữ liệu đã lọc
    filteredProducts.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${product.Product_ID}</td>
            <td>${product.Product_Code}</td>
            <td>${product.OrderCount}</td>
            <td>${product.SupplierName}</td>`;
        tableBody.appendChild(row);
    });
}

function refreshTable() {
    const tableBody = document.getElementById('product-data');
    const supplierFilter = document.getElementById('supplier-filter');
    
    // Xóa giá trị chọn lọc nhà cung cấp
    supplierFilter.value = '';

    // Hiển thị lại dữ liệu ban đầu
    tableBody.innerHTML = '';
    window.allProducts.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${product.Product_ID}</td>
            <td>${product.Product_Code}</td>
            <td>${product.OrderCount}</td>
            <td>${product.SupplierName}</td>`;
        tableBody.appendChild(row);
    });
}
