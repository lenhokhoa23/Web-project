function displayCurrentDate() {
    const currentDateElement = document.getElementById('current-date');
    const today = new Date();
    
    const day = ("0" + today.getDate()).slice(-2);
    const month = ("0" + (today.getMonth() + 1)).slice(-2);
    const year = today.getFullYear();

    const formattedDate = `${day}/${month}/${year}`;
    currentDateElement.textContent = formattedDate;
}

document.addEventListener('DOMContentLoaded', displayCurrentDate);