const express = require('express');
const router = express.Router();
const ProjectController = require('../controllers/ProjectController');

router.get('/projects', ProjectController.showProjectList);
router.get('/projects/add', ProjectController.showAddProjectForm);
router.get('/api/projects', ProjectController.getProjects);
router.get('/api/projects/expire-project', ProjectController.getExpirePro);
router.post('/api/projects', ProjectController.addProject);
router.delete('/projects/:id', ProjectController.deleteProject);

module.exports = router;
