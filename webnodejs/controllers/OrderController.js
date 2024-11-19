const Order = require('../models/Order');

const orderController = {
    showOrderList: (req, res) => {
        res.render('order');
    },

    getOrders: (req, res) => {
        Order.getAllOrders((err, orders) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách project:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(orders);
        });
    }
};

module.exports = orderController;