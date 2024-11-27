const express = require('express');
const router = express.Router();
const FeedbackController = require('../controllers/FeedbackController');

router.get('/feedback', FeedbackController.showFeedbackList);
router.get('/api/feedback', FeedbackController.getFeedbacks);
router.get('/api/feedback/customer/:id', FeedbackController.getFeedbackByCustomerId);
router.get('/api/feedback/rating/:rating', FeedbackController.getFeedbackByRating);

module.exports = router;
