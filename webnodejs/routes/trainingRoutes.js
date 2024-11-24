const express = require('express');
const router = express.Router();

const trainingController = require('../controllers/trainingController');

router.get('/training', trainingController.showTrainingList);
router.get('/api/training', trainingController.getTraining);
router.post('/api/training', trainingController.addTraining);
router.get('/training/add', trainingController.showAddTrainingForm);
module.exports = router;