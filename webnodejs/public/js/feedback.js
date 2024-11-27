let allFeedbacks = [];

function displayFeedbacks(feedbacks) {
    const tableBody = document.getElementById('feedback-data');
    if (!tableBody) return;

    tableBody.innerHTML = '';

    feedbacks.forEach(feedback => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${feedback.Feedback_ID}</td>
            <td>${feedback.Customer_ID}</td>
            <td>${feedback.Order_ID}</td>
            <td>${feedback.Rating}</td>
            <td>${feedback.Comments || '-'}</td>
        `;
        tableBody.appendChild(row);
    });
}

function populateRatingFilter(feedbacks) {
    const ratings = [...new Set(feedbacks.map(feedback => feedback.Rating))].sort((a, b) => a - b);
    const ratingFilter = document.getElementById('rating-filter');
    
    ratings.forEach(rating => {
        const option = document.createElement('option');
        option.value = rating;
        option.textContent = `Rating: ${rating}`;
        ratingFilter.appendChild(option);
    });
}

function filterByRating() {
    const selectedRating = document.getElementById('rating-filter').value;
    const filteredFeedbacks = allFeedbacks.filter(feedback => 
        !selectedRating || feedback.Rating.toString() === selectedRating
    );

    displayFeedbacks(filteredFeedbacks);
}

function searchFeedback() {
    const input = document.getElementById('search-bar').value.toLowerCase();
    const filteredFeedbacks = allFeedbacks.filter(feedback =>
        Object.values(feedback).some(value => 
            String(value).toLowerCase().includes(input)
        )
    );

    displayFeedbacks(filteredFeedbacks);
}

function setupFeedbackListPage() {
    fetch('/api/feedback')
        .then(response => response.json())
        .then(data => {
            allFeedbacks = data;
            displayFeedbacks(allFeedbacks);
            populateRatingFilter(allFeedbacks);
        })
        .catch(error => console.error('Error fetching feedbacks:', error));
}

function searchFeedbackByCustomerId() {
    const customerIdInput = document.getElementById('id-search').value;
    if (!customerIdInput) {
        alert('Vui lòng nhập Mã KH!');
        return;
    }

    fetch(`/api/feedback/customer/${customerIdInput}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Không tìm thấy phản hồi với Mã KH này');
            }
            return response.json();
        })
        .then(feedbacks => {
            if (feedbacks && feedbacks.length > 0) {
                displayFeedbacks(feedbacks);
            } else {
                alert('Không tìm thấy phản hồi với Mã KH này');
                displayFeedbacks([]);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message);
        });
}

function refreshFeedbackTable() {
    const tableBody = document.getElementById('feedback-data');
    const ratingFilter = document.getElementById('rating-filter');
    
    ratingFilter.value = '';

    tableBody.innerHTML = '';
    allFeedbacks.forEach(feedback => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${feedback.Feedback_ID}</td>
            <td>${feedback.Customer_ID}</td>
            <td>${feedback.Order_ID}</td>
            <td>${feedback.Rating}</td>
            <td>${feedback.Comments || '-'}</td>
        `;
        tableBody.appendChild(row);
    });
}

function searchFeedbackByRating() {
    const ratingInput = document.getElementById('rating-search').value;
    if (!ratingInput) {
        alert('Vui lòng nhập điểm số!');
        return;
    }

    fetch(`/api/feedback/rating/${ratingInput}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Không tìm thấy phản hồi với điểm số này');
            }
            return response.json();
        })
        .then(feedbacks => {
            if (feedbacks && feedbacks.length > 0) {
                displayFeedbacks(feedbacks);
            } else {
                alert('Không tìm thấy phản hồi với điểm số này');
                displayFeedbacks([]);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert(error.message);
        });
}

let sortState = {};

function sortTable(column) {
    if (!sortState[column]) {
        sortState[column] = 'asc';
    } else if (sortState[column] === 'asc') {
        sortState[column] = 'desc';
    } else {
        sortState[column] = null;
    }

    let sortedFeedbacks;
    if (sortState[column] === 'asc') {
        sortedFeedbacks = [...allFeedbacks].sort((a, b) =>
            a[column] > b[column] ? 1 : a[column] < b[column] ? -1 : 0
        );
    } else if (sortState[column] === 'desc') {
        sortedFeedbacks = [...allFeedbacks].sort((a, b) =>
            a[column] < b[column] ? 1 : a[column] > b[column] ? -1 : 0
        );
    } else {
        sortedFeedbacks = [...allFeedbacks];
    }
    displayFeedbacks(sortedFeedbacks);
}

document.addEventListener('DOMContentLoaded', () => {
    setupFeedbackListPage();
    document.getElementById('rating-filter').addEventListener('change', filterByRating);
    document.getElementById('search-bar').addEventListener('input', searchFeedback);
});
