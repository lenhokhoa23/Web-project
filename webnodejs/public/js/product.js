document.addEventListener('DOMContentLoaded', async () => {
    try {
        const response = await fetch('/api/products');
        const data = await response.json();
        const tableBody = document.getElementById('product-data');

        window.allProducts = data;

        data.forEach(product => {
        const row = document.createElement('tr');
            row.innerHTML = `
            <td>${product.Product_ID}</td>
            <td>${product.Product_Code}</td>
            <td>${product.OrderCount}</td>
            <td>${product.SupplierName}</td>
            <td>${product.quantityInStock}</td>`;
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

    const filteredProducts = window.allProducts.filter(product => 
        !supplierFilter || product.SupplierName === supplierFilter
    );

    filteredProducts.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${product.Product_ID}</td>
            <td>${product.Product_Code}</td>
            <td>${product.OrderCount}</td>
            <td>${product.SupplierName}</td>
            <td>${product.quantityInStock}</td>`;
        tableBody.appendChild(row);
    });
}

function refreshTable() {
    const tableBody = document.getElementById('product-data');
    const supplierFilter = document.getElementById('supplier-filter');
    
    supplierFilter.value = '';

    tableBody.innerHTML = '';
    window.allProducts.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${product.Product_ID}</td>
            <td>${product.Product_Code}</td>
            <td>${product.OrderCount}</td>
            <td>${product.SupplierName}</td>
            <td>${product.quantityInStock}</td>`;
        tableBody.appendChild(row);
    });
}

function filterOutOfStock() {
    const tableBody = document.getElementById('product-data');
    const outOfStockProducts = window.allProducts.filter(product => product.quantityInStock === 0);

    tableBody.innerHTML = '';

    outOfStockProducts.forEach(product => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${product.Product_ID}</td>
            <td>${product.Product_Code}</td>
            <td>${product.OrderCount}</td>
            <td>${product.SupplierName}</td>
            <td>${product.quantityInStock}</td> <!-- Hiển thị số lượng trong kho -->
        `;
        tableBody.appendChild(row);
    });
}

document.getElementById('add-product-form').addEventListener('submit', async (event) => {
    event.preventDefault();

    const productData = {
        Product_Code: document.getElementById('product-name').value,
        Supplier_ID: parseInt(document.getElementById('supplier-id').value),
        BuyPrice: parseFloat(document.getElementById('buy-price').value),
        ProductRating: parseInt(document.getElementById('product-rating').value),
        QuantityInStock: parseInt(document.getElementById('quantity-in-stock').value),
    };

    try {
        const response = await fetch('/api/products', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(productData),
        });

        if (response.ok) {
            alert('Thêm sản phẩm thành công!');
            refreshTable();
        } else {
            const error = await response.json();
            alert(`Lỗi: ${error.message}`);
        }
    } catch (error) {
        console.error('Lỗi khi thêm sản phẩm:', error);
        alert('Đã xảy ra lỗi khi thêm sản phẩm.');
    }
});

function toggleForm(formContainerId) {
    const formContainer = document.getElementById(formContainerId);
    if (formContainer.style.display === 'none' || formContainer.style.display === '') {
        formContainer.style.display = 'block';
    } else {
        formContainer.style.display = 'none';
    }
}

document.getElementById('add-supplier-form').addEventListener('submit', async (event) => {
    event.preventDefault();

    const supplierData = {
        SupplierName: document.getElementById('supplier-name').value,
        SupplierEmail: document.getElementById('supplier-email').value,
        SupplierAddress: document.getElementById('supplier-address').value,
    };

    try {
        const response = await fetch('/api/suppliers', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(supplierData),
        });
        console.log(JSON.stringify(supplierData))
        if (response.ok) {
            alert('Thêm nhà cung cấp thành công!');
            refreshTable();
        } else {
            const error = await response.json();
            alert(`Lỗi: ${error.message}`);
        }
    } catch (error) {
        console.error('Lỗi khi thêm nhà cung cấp:', error);
        alert('Đã xảy ra lỗi khi thêm nhà cung cấp.');
    }
});