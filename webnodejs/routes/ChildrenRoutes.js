// routes/childrenRoutes.js
const express = require('express');
const router = express.Router();
const childrenController = require('../controllers/childrenController');

// Route hiển thị trang
router.get('/children', childrenController.showChildrenList);

// Route API
router.get('/api/children', childrenController.getChildren);
router.get('/api/children/:id', childrenController.getChildrenById);

module.exports = router;