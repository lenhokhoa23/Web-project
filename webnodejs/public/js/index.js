// Hàm lấy ngày hiện tại và hiển thị trên trang
function displayCurrentDate() {
    const currentDateElement = document.getElementById('current-date');
    const today = new Date();
    
    const day = ("0" + today.getDate()).slice(-2); // Thêm số 0 nếu nhỏ hơn 10
    const month = ("0" + (today.getMonth() + 1)).slice(-2); // Tháng bắt đầu từ 0
    const year = today.getFullYear();

    // Định dạng ngày/tháng/năm
    const formattedDate = `${day}/${month}/${year}`;
    currentDateElement.textContent = formattedDate;
}

// Gọi hàm khi trang được tải
document.addEventListener('DOMContentLoaded', displayCurrentDate);