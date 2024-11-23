const express = require('express');
const router = express.Router();
const projectController = require('../controllers/projectController');


router.get('/projects', projectController.showProjectList);
router.get('/projects/add', projectController.showAddProjectForm);
router.get('/api/projects', projectController.getProjects);
router.get('/api/projects/expire-project', projectController.getExpirePro);
router.post('/api/projects', projectController.addProject);
router.delete('/projects/:id', projectController.deleteProject);
module.exports = router;
