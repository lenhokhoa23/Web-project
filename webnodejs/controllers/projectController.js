const Project = require('../models/Project');

const ProjectController = {
    showProjectList: (req, res) => {
        res.render('project');
    },

    showAddProjectForm: (req, res) => {
        res.render('addProject');
    },

    getProjects: (req, res) => {
        Project.getAllProjects((err, projects) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách project:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(projects);
        });
    },

    getExpirePro: (req, res) => {
        Project.getExpireProjects((err, projects) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách project:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(projects);
        });
    },

    addProject: (req, res) => {
        const { ProjectName, Address, ContractDate, ContractDue, Customer_ID } = req.body;
        console.log('Dữ liệu nhận được từ form:', req.body);
        if (!ProjectName || !Address || !ContractDate || !ContractDue || !Customer_ID) {
            return res.status(400).json({ error: 'Missing required project data' });
        }

        const newProject = {
            ProjectName, Address, ContractDate, ContractDue, Customer_ID
        };

        Project.addNewProject(newProject, (err, result) => {
            if (err) {
                console.error('Lỗi khi thêm dự án mới:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.redirect('/projects');
        });
    },

    deleteProject: (req, res) => {
        const projectId = req.params.id;
        console.log('Project ID (after trim):', projectId);
        if (!projectId) {
            return res.status(400).json({ error: 'Project ID is required' });
        }

        Project.deleteProjectById(projectId, (err, result) => {
            if (err) {
                console.error('Lỗi khi xoá dự án:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (result.affectedRows === 0) {
                return res.status(404).json({ error: 'Dự án không tìm thấy' });
            }

            res.status(200).json({ message: 'Dự án đã được xoá thành công.' });
        });
    }
};

module.exports = ProjectController;
