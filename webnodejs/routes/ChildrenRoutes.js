const express = require('express');
const router = express.Router();
const ChildrenController = require('../controllers/ChildrenController');

router.get('/children', ChildrenController.showChildrenList);
router.get('/api/children', ChildrenController.getChildren);
router.get('/api/children/:id', ChildrenController.getChildrenById);

module.exports = router;