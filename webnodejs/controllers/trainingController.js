const Training = require('../models/Training');

const trainingController = {
    showTrainingList: (req, res) => {
        res.render('training');
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

module.exports = trainingController;