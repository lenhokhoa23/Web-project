const Project = require('../models/Project');

const projectController = {
    showProjectList: (req, res) => {
        res.render('project');
    },

    getProjects: (req, res) => {
        Project.getAllProjects((err, projects) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách project:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(projects);
        });
    }



};

module.exports = projectController;


