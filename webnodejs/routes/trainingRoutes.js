const express = require('express');
const router = express.Router();
const TrainingController = require('../controllers/trainingController');

router.get('/training', TrainingController.showTrainingList);
router.get('/api/training', TrainingController.getTraining);
router.post('/api/training', TrainingController.addTraining);
router.get('/training/add', TrainingController.showAddTrainingForm);

module.exports = router;