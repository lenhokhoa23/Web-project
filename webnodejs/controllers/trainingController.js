const Training = require('../models/Training');

const TrainingController = {

    showAddTrainingForm: (req, res) => {
        res.render('addTraining');
    },
    showTrainingList: (req, res) => {
        res.render('training');
    },

    addTraining: (req, res) => {
        const { TrainingName, StartDate, EndDate, Employee_ID } = req.body;
        console.log('Dữ liệu nhận được từ form:', req.body);
        if (!TrainingName || !StartDate || !EndDate || !Employee_ID) {
            return res.status(400).json({ error: 'Missing required training data' });
        }

        const newTraining = {
            TrainingName, StartDate, EndDate, Employee_ID
        };

        Training.addTraining(newTraining, (err, result) => {
            if (err) {
                console.error('Lỗi khi thêm đào tạo mới:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.redirect('/training');
        });
    },

    getTraining: (req, res) => {
        Training.getAllTraining((err, training) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách training:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(training);
        });
    }
};

module.exports = TrainingController;