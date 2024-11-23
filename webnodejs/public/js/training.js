let trainings = [];
function formatDate(dateString) {
    const date = new Date(dateString);
    return date.toLocaleDateString('vi-VN');
}

function searchTrainings() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const cards = document.getElementsByClassName('training-card');

    for (let card of cards) {
        const text = card.textContent.toLowerCase();
        card.style.display = text.includes(input) ? '' : 'none';
    }
}
function refresh() {
    displayTrainings(trainings);
}

function displayTrainings(trainings) {
    const trainingContainer = document.getElementById('training-data');
    trainingContainer.innerHTML = '';

    trainings.forEach(training => {
        const trainingCard = document.createElement('div');
        trainingCard.classList.add('training-card');
        trainingCard.innerHTML = `
            <h3 class="training-name">${training.TrainingName}</h3>
            <div class="training-details">
                <p><strong>Mã Đào tạo:</strong> ${training.Training_ID}</p>
                <p><strong>Ngày bắt đầu:</strong> ${formatDate(training.StartDate)}</p>
                <p><strong>Ngày kết thúc:</strong> ${formatDate(training.EndDate)}</p>
                <p><strong>Nhân viên:</strong> ${training.EmployeeName}</p>
            </div>
        `;
        trainingCard.querySelector('.training-name').addEventListener('click', () => {
            const details = trainingCard.querySelector('.training-details');
            details.style.display = details.style.display === 'none' ? 'block' : 'none';
        });
        trainingContainer.appendChild(trainingCard);
    });
}

document.addEventListener('DOMContentLoaded', () => {
    fetch('/api/training')
        .then(response => response.json())
        .then(data => {
            trainings = data; 
            displayTrainings(data);
        })
        .catch(error => console.error('Lỗi khi lấy dữ liệu đào tạo:', error));

    document.getElementById('search-bar').addEventListener('keyup', searchTrainings);
    document.getElementById('refresh').addEventListener('click', refresh);
});