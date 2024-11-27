const Feedback = require('../models/Feedback');

const FeedbackController = {
    showFeedbackList: (req, res) => {
        res.render('feedback');
    },

    getFeedbacks: (req, res) => {
        Feedback.getAllFeedbacks((err, feedbacks) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách phản hồi:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(feedbacks);
        });
    },

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
            res.json(feedbacks);
        });
    },

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
            res.json(feedbacks);
        });
    }

};

module.exports = FeedbackController;
