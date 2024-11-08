const express = require('express');
const router = express.Router();
const projectController = require('../controllers/projectController');

router.get('/projects', projectController.showProjectList);
router.get('/api/projects', projectController.getProjects);
router.get('/api/projects/expire-project', projectController.getExpirePro);


module.exports = router;