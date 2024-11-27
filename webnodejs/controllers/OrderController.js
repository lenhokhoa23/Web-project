const Order = require('../models/order');

const OrderController = {
    showOrderList: (req, res) => {
        res.render('order');
    },

    getOrders: (req, res) => {
        Order.getAllOrders((err, orders) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách order:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(orders);
        });
    },

    getOrdersValue: (req, res) => {
        Order.getValueOrders((err, orders) => {
            if (err) {
                console.error('Lỗi khi lấy giá trị đơn hàng:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(orders);
        });
    },

    getOrdersByStatus: (req, res) => {
        const status = req.params.status;
        Order.getOrdersByStatus(status, (err, orders) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách order theo trạng thái:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(orders);
        });
    },

    getOrdersNotShipped: (req, res) => {
        Order.getOrdersNotShippedYet((err, notShippedOrders) => {
            if (err) {
                console.error('Lỗi khi lấy danh sách order chưa giao:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(notShippedOrders);
        });
    },

    getProductValues: (req, res) => {
        Order.getValueOfProduct((err, products) => {
            if (err) {
                console.error('Lỗi khi lấy giá trị sản phẩm:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(products);
        });
    },

    getOrderDetails: (req, res) => {
        const orderId = req.params.orderId;
        Order.getOrderDetails(orderId, (err, details) => {
            if (err) {
                console.error('Lỗi khi lấy chi tiết đơn hàng:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(details);
        });
    },

    getOrdersByDateRange: (req, res) => {
        const start = req.query.start || '';
        const end = req.query.end || '';

        if (!start || !end) {
            return res.status(400).json({ error: 'Start and end dates are required' });
        }

        Order.getOrdersByDateRange(start, end, (err, orders) => {
            if (err) {
                console.error('Lỗi khi lọc đơn hàng theo ngày:', err);
                return res.status(500).json({ error: 'Lỗi server' });
            }
            res.json(orders);
        });
    },
    getTotalRevenue: (req, res) => {
        const { start, end } = req.query;
        if (!start || !end) {
            return res.status(400).json({ error: 'Start and end dates are required' });
        }

        Order.getTotalRevenue(start, end, (err, totalRevenue) => {
            if (err) {
                console.error('Error calculating total revenue:', err);
                return res.status(500).json({ error: 'Server error' });
            }
            res.json({ totalRevenue });
        });
    },

    getTopCustomers: (req, res) => {
        Order.getTopCustomers((err, topCustomers) => {
            if (err) {
                console.error('Error fetching top customers:', err);
                return res.status(500).json({ error: 'Server error' });
            }
            res.json(topCustomers);
        });
    }
};

module.exports = OrderController;