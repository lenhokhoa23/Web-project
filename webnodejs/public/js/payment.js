let allPayments = [];

function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN');
}

function displayPayments(payments) {
    const tableBody = document.getElementById('payment-data');
    if (!tableBody) return;

    tableBody.innerHTML = '';

    payments.forEach(payment => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${payment.checkNumber}</td>
            <td>${payment.customer_ID}</td>
            <td>${payment.CustomerName}</td>
            <td>${payment.CustomerEmail}</td>
            <td>${payment.amount}</td>
            <td>${formatDate(payment.paymentDate)}</td>
        `;
        tableBody.appendChild(row);
    });
}

function searchPayment() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const filteredPayments = allPayments.filter(payment =>
        Object.values(payment).some(value => 
            String(value).toLowerCase().includes(input)
        )
    );

    displayPayments(filteredPayments);
}

function setupPaymentListPage() {
    fetch('/api/payment')
        .then(response => response.json())
        .then(data => {
            allPayments = data;
            displayPayments(allPayments);
        })
        .catch(error => console.error('Error fetching payments:', error));
}

function searchPaymentByCustomerId() {
    const customerIdInput = document.getElementById('id-search').value;
    if (!customerIdInput) {
        alert('Vui lòng nhập Mã KH!');
        return;
    }

    fetch(`/api/payment/customer/${customerIdInput}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Khách hàng chưa thanh toán đơn nào');
            }
            return response.json();
        })
        .then(payments => {
            if (payments && payments.length > 0) {
                displayPayments(payments);
            } else {
                alert('Không tìm thấy thanh toán với Mã KH này');
                displayPayments([]);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message);
        });
}

function refreshPaymentTable() {
    const tableBody = document.getElementById('payment-data');
    tableBody.innerHTML = '';
    allPayments.forEach(payment => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${payment.checkNumber}</td>
            <td>${payment.customer_ID}</td>
            <td>${payment.CustomerName}</td>
            <td>${payment.CustomerEmail}</td>
            <td>${payment.amount}</td>
            <td>${formatDate(payment.paymentDate)}</td>
        `;
        tableBody.appendChild(row);
    });
}



document.addEventListener('DOMContentLoaded', () => {
    setupPaymentListPage();
    document.getElementById('search-bar').addEventListener('input', searchPayment);
});
