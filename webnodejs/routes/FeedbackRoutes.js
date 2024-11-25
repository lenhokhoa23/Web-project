// routes/FeedbackRoutes.js
const express = require('express');
const router = express.Router();
const feedbackController = require('../controllers/feedbackController');

router.get('/feedback', feedbackController.showFeedbackList);
router.get('/api/feedback', feedbackController.getFeedbacks);
router.get('/api/feedback/customer/:id', feedbackController.getFeedbackByCustomerId);
router.get('/api/feedback/rating/:rating', feedbackController.getFeedbackByRating);

module.exports = router;
