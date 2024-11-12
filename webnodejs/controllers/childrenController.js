// controllers/childrenController.js
const Children = require('../models/Children');

const childrenController = {
    // Hiển thị trang danh sách trẻ em
    showChildrenList: (req, res) => {
        res.render('children');
    },

    // Lấy dữ liệu trẻ em cho API
    getChildren: (req, res) => {
        Children.getAllChildren((err, children) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách trẻ em:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(children);
        });
    },

    // Lấy thông tin một trẻ em
    getChildrenById: (req, res) => {
        const id = req.params.id;
        Employee.getChildrenById(id, (err, children) => {
            if (err) {
                return res.status(500).json({ error: 'Lỗi server' });
            }
            if (!children) {
                return res.status(404).json({ error: 'Không tìm thấy trẻ em' });
            }
            res.json(children);
        });
    }
};

module.exports = childrenController;