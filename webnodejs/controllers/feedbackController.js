// controllers/feedbackController.js
const Feedback = require('../models/Feedback');

const feedbackController = {
    // Hiển thị trang danh sách phản hồi
    showFeedbackList: (req, res) => {
        res.render('feedback'); // Đảm bảo bạn render đúng view của bảng Feedback
    },

    // Lấy tất cả phản hồi cho API
    getFeedbacks: (req, res) => {
        Feedback.getAllFeedbacks((err, feedbacks) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách phản hồi:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(feedbacks); // Trả về danh sách phản hồi dưới dạng JSON
        });
    },

    // Lấy thông tin phản hồi theo Customer_ID
    getFeedbackByCustomerId: (req, res) => {
        const customerId = req.params.id;
        Feedback.getFeedbacksByCustomerId(customerId, (err, feedbacks) => {
            if (err) {
                console.error('Lỗi khi lấy phản hồi:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (!feedbacks || feedbacks.length === 0) {
                return res.status(404).json({ error: 'Không tìm thấy phản hồi' });
            }
            res.json(feedbacks); // Trả về danh sách phản hồi theo Customer_ID
        });
    },

    // Lấy thông tin phản hồi theo điểm số
    getFeedbackByRating: (req, res) => {
        const rating = req.params.rating;
        Feedback.getFeedbacksByRating(rating, (err, feedbacks) => {
            if (err) {
                console.error('Lỗi khi lấy phản hồi theo điểm số:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (!feedbacks || feedbacks.length === 0) {
                return res.status(404).json({ error: 'Không tìm thấy phản hồi với điểm số này' });
            }
            res.json(feedbacks); // Trả về danh sách phản hồi theo điểm số
        });
    }

};

module.exports = feedbackController;
